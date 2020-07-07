`timescale 1ns/10ps
`include "Butterfly.v"
`include "fftCalculator.v"
`include "ifftCalculator.v"

module top();

reg clk,reset;
int fr,fi,fo,ffr,ffi;
int readDataReal,readDataImag,filReal,filImag;
string strIn;
int icnt;

real realin,imagin,filterDataReal,filterDataImag,realinIfft,imaginIfft,iFFTDataReal,iFFTDataImag;
reg startin,startinIfft;

real realout,imagout;
reg startout,startoutIfft;

real realout0,imagout0;
reg startout0;

int inputblk=0;
int i;

string imaginaryString;
real realArrayFiltered[0:130000],imagArrayFiltered[0:130000];


initial begin
    clk=0;
    startin=0;
	startinIfft=0;
    repeat(2000) begin
        #5 clk=0;
        #5 clk=1;
    end
    $fclose(fo);  
    $display("Ran out of clocks");
    $finish;
end

initial begin
    reset=1;
    repeat(3) @(posedge(clk)) #1;
    reset=0;
end

int count,ifftCount;
initial begin
fr = $fopen("input_real.txt","r");
fi = $fopen("input_imag.txt","r");
fo = $fopen("outputData.txt","w");
ffr = $fopen("filterData.txt","r");
ffi = $fopen("filterData.txt","r");
end


reg endOfFile;

always @(posedge clk) begin
	if(reset) begin
		startin<=0;
	end 
	else begin
		if (count==0)
			startin<=#1 1;
		else
			startin<=#1 0;
			
		if (ifftCount==0)
			startinIfft<=#1 1;
		else
			startinIfft<=#1 0;
	end 
end

initial begin
	endOfFile=0;
	count=-1;ifftCount=-1;
	icnt=0;
	if(reset==0) begin
		count=0;
		//Applying FFT and Filtering Data
		while(endOfFile==0) begin		
			if(count==512) begin
				while(startout!=0) @(posedge clk) #1;
				while(startout) begin
					filReal=$fscanf(ffr,"%f\n",filterDataReal);
					filImag=$fscanf(ffi,"%f\n",filterDataImag);
					realArrayFiltered[icnt]= realout*filterDataReal;
					imagArrayFiltered[icnt]= imagout*filterDataImag;
					icnt=icnt+1;
					@(posedge clk);					
				end
				$fclose(ffr);
				$fclose(ffi);
				ffr = $fopen("filterData.txt","r");
				ffi = $fopen("filterData.txt","r");
				count=0;
			end
			if (!$feof(fr)) begin
				readDataReal=$fscanf(fr,"%f\n",realin);
				imagin= 0;
				count=count+1;
			end 
			else
				endOfFile=1;
			@(posedge clk);
		end
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		
		//Applying iFFT
		ifftCount=0;
		
		for (i=0; i<=icnt; i=i+1) begin
			if(ifftCount==512) begin
				while(startoutIfft!=0)@(posedge clk) #1;
				while(startoutIfft) begin
					filReal=$fscanf(ffr,"%f\n",iFFTDataReal);
					filImag=$fscanf(ffi,"%f\n",iFFTDataImag);
					if(filImag<0)
						$fwrite(fo,"%f%fj\n",filReal,filImag);
					else
						$fwrite(fo,"%f+%fj\n",filReal,filImag);
					@(posedge clk);					
				end
				ifftCount=0;
			end
			realinIfft=realArrayFiltered[i];
			imaginIfft= imagArrayFiltered[i];
			ifftCount=ifftCount+1;

			@(posedge clk);
		end
	end
end


initial begin
    $dumpfile("fft.vpd");
    $dumpvars(0,top);
end



fftCalculator f1(clk,reset,realin,imagin,startin,startout,realout,imagout);
ifftCalculator f2(clk,reset,realinIfft,imaginIfft,startinIfft,startoutIfft,iFFTDataReal,iFFTDataImag);

endmodule : top
