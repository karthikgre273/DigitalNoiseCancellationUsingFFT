package twiddleFactorgenerator;
public class Twiddles_512_fft {
	public static double generate(boolean imag,int currentStage, int level){
		switch (currentStage){
		case 0:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			}
		case 1:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.000000;
			else return -1.000000;
			}
		case 2:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.707107;
			else return -0.707107;
			case 2:if(!imag) return 0.000000;
			else return -1.000000;
			case 3:if(!imag) return -0.707107;
			else return -0.707107;
			}
		case 3:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.923880;
			else return -0.382683;
			case 2:if(!imag) return 0.707107;
			else return -0.707107;
			case 3:if(!imag) return 0.382683;
			else return -0.923880;
			case 4:if(!imag) return 0.000000;
			else return -1.000000;
			case 5:if(!imag) return -0.382683;
			else return -0.923880;
			case 6:if(!imag) return -0.707107;
			else return -0.707107;
			case 7:if(!imag) return -0.923880;
			else return -0.382683;
			}
		case 4:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.980785;
			else return -0.195090;
			case 2:if(!imag) return 0.923880;
			else return -0.382683;
			case 3:if(!imag) return 0.831470;
			else return -0.555570;
			case 4:if(!imag) return 0.707107;
			else return -0.707107;
			case 5:if(!imag) return 0.555570;
			else return -0.831470;
			case 6:if(!imag) return 0.382683;
			else return -0.923880;
			case 7:if(!imag) return 0.195090;
			else return -0.980785;
			case 8:if(!imag) return 0.000000;
			else return -1.000000;
			case 9:if(!imag) return -0.195090;
			else return -0.980785;
			case 10:if(!imag) return -0.382683;
			else return -0.923880;
			case 11:if(!imag) return -0.555570;
			else return -0.831470;
			case 12:if(!imag) return -0.707107;
			else return -0.707107;
			case 13:if(!imag) return -0.831470;
			else return -0.555570;
			case 14:if(!imag) return -0.923880;
			else return -0.382683;
			case 15:if(!imag) return -0.980785;
			else return -0.195090;
			}
		case 5:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.995185;
			else return -0.098017;
			case 2:if(!imag) return 0.980785;
			else return -0.195090;
			case 3:if(!imag) return 0.956940;
			else return -0.290285;
			case 4:if(!imag) return 0.923880;
			else return -0.382683;
			case 5:if(!imag) return 0.881921;
			else return -0.471397;
			case 6:if(!imag) return 0.831470;
			else return -0.555570;
			case 7:if(!imag) return 0.773010;
			else return -0.634393;
			case 8:if(!imag) return 0.707107;
			else return -0.707107;
			case 9:if(!imag) return 0.634393;
			else return -0.773010;
			case 10:if(!imag) return 0.555570;
			else return -0.831470;
			case 11:if(!imag) return 0.471397;
			else return -0.881921;
			case 12:if(!imag) return 0.382683;
			else return -0.923880;
			case 13:if(!imag) return 0.290285;
			else return -0.956940;
			case 14:if(!imag) return 0.195090;
			else return -0.980785;
			case 15:if(!imag) return 0.098017;
			else return -0.995185;
			case 16:if(!imag) return 0.000000;
			else return -1.000000;
			case 17:if(!imag) return -0.098017;
			else return -0.995185;
			case 18:if(!imag) return -0.195090;
			else return -0.980785;
			case 19:if(!imag) return -0.290285;
			else return -0.956940;
			case 20:if(!imag) return -0.382683;
			else return -0.923880;
			case 21:if(!imag) return -0.471397;
			else return -0.881921;
			case 22:if(!imag) return -0.555570;
			else return -0.831470;
			case 23:if(!imag) return -0.634393;
			else return -0.773010;
			case 24:if(!imag) return -0.707107;
			else return -0.707107;
			case 25:if(!imag) return -0.773010;
			else return -0.634393;
			case 26:if(!imag) return -0.831470;
			else return -0.555570;
			case 27:if(!imag) return -0.881921;
			else return -0.471397;
			case 28:if(!imag) return -0.923880;
			else return -0.382683;
			case 29:if(!imag) return -0.956940;
			else return -0.290285;
			case 30:if(!imag) return -0.980785;
			else return -0.195090;
			case 31:if(!imag) return -0.995185;
			else return -0.098017;
			}
		case 6:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.998795;
			else return -0.049068;
			case 2:if(!imag) return 0.995185;
			else return -0.098017;
			case 3:if(!imag) return 0.989177;
			else return -0.146730;
			case 4:if(!imag) return 0.980785;
			else return -0.195090;
			case 5:if(!imag) return 0.970031;
			else return -0.242980;
			case 6:if(!imag) return 0.956940;
			else return -0.290285;
			case 7:if(!imag) return 0.941544;
			else return -0.336890;
			case 8:if(!imag) return 0.923880;
			else return -0.382683;
			case 9:if(!imag) return 0.903989;
			else return -0.427555;
			case 10:if(!imag) return 0.881921;
			else return -0.471397;
			case 11:if(!imag) return 0.857729;
			else return -0.514103;
			case 12:if(!imag) return 0.831470;
			else return -0.555570;
			case 13:if(!imag) return 0.803208;
			else return -0.595699;
			case 14:if(!imag) return 0.773010;
			else return -0.634393;
			case 15:if(!imag) return 0.740951;
			else return -0.671559;
			case 16:if(!imag) return 0.707107;
			else return -0.707107;
			case 17:if(!imag) return 0.671559;
			else return -0.740951;
			case 18:if(!imag) return 0.634393;
			else return -0.773010;
			case 19:if(!imag) return 0.595699;
			else return -0.803208;
			case 20:if(!imag) return 0.555570;
			else return -0.831470;
			case 21:if(!imag) return 0.514103;
			else return -0.857729;
			case 22:if(!imag) return 0.471397;
			else return -0.881921;
			case 23:if(!imag) return 0.427555;
			else return -0.903989;
			case 24:if(!imag) return 0.382683;
			else return -0.923880;
			case 25:if(!imag) return 0.336890;
			else return -0.941544;
			case 26:if(!imag) return 0.290285;
			else return -0.956940;
			case 27:if(!imag) return 0.242980;
			else return -0.970031;
			case 28:if(!imag) return 0.195090;
			else return -0.980785;
			case 29:if(!imag) return 0.146730;
			else return -0.989177;
			case 30:if(!imag) return 0.098017;
			else return -0.995185;
			case 31:if(!imag) return 0.049068;
			else return -0.998795;
			case 32:if(!imag) return 0.000000;
			else return -1.000000;
			case 33:if(!imag) return -0.049068;
			else return -0.998795;
			case 34:if(!imag) return -0.098017;
			else return -0.995185;
			case 35:if(!imag) return -0.146730;
			else return -0.989177;
			case 36:if(!imag) return -0.195090;
			else return -0.980785;
			case 37:if(!imag) return -0.242980;
			else return -0.970031;
			case 38:if(!imag) return -0.290285;
			else return -0.956940;
			case 39:if(!imag) return -0.336890;
			else return -0.941544;
			case 40:if(!imag) return -0.382683;
			else return -0.923880;
			case 41:if(!imag) return -0.427555;
			else return -0.903989;
			case 42:if(!imag) return -0.471397;
			else return -0.881921;
			case 43:if(!imag) return -0.514103;
			else return -0.857729;
			case 44:if(!imag) return -0.555570;
			else return -0.831470;
			case 45:if(!imag) return -0.595699;
			else return -0.803208;
			case 46:if(!imag) return -0.634393;
			else return -0.773010;
			case 47:if(!imag) return -0.671559;
			else return -0.740951;
			case 48:if(!imag) return -0.707107;
			else return -0.707107;
			case 49:if(!imag) return -0.740951;
			else return -0.671559;
			case 50:if(!imag) return -0.773010;
			else return -0.634393;
			case 51:if(!imag) return -0.803208;
			else return -0.595699;
			case 52:if(!imag) return -0.831470;
			else return -0.555570;
			case 53:if(!imag) return -0.857729;
			else return -0.514103;
			case 54:if(!imag) return -0.881921;
			else return -0.471397;
			case 55:if(!imag) return -0.903989;
			else return -0.427555;
			case 56:if(!imag) return -0.923880;
			else return -0.382683;
			case 57:if(!imag) return -0.941544;
			else return -0.336890;
			case 58:if(!imag) return -0.956940;
			else return -0.290285;
			case 59:if(!imag) return -0.970031;
			else return -0.242980;
			case 60:if(!imag) return -0.980785;
			else return -0.195090;
			case 61:if(!imag) return -0.989177;
			else return -0.146730;
			case 62:if(!imag) return -0.995185;
			else return -0.098017;
			case 63:if(!imag) return -0.998795;
			else return -0.049068;
			}
		case 7:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.999699;
			else return -0.024541;
			case 2:if(!imag) return 0.998795;
			else return -0.049068;
			case 3:if(!imag) return 0.997290;
			else return -0.073565;
			case 4:if(!imag) return 0.995185;
			else return -0.098017;
			case 5:if(!imag) return 0.992480;
			else return -0.122411;
			case 6:if(!imag) return 0.989177;
			else return -0.146730;
			case 7:if(!imag) return 0.985278;
			else return -0.170962;
			case 8:if(!imag) return 0.980785;
			else return -0.195090;
			case 9:if(!imag) return 0.975702;
			else return -0.219101;
			case 10:if(!imag) return 0.970031;
			else return -0.242980;
			case 11:if(!imag) return 0.963776;
			else return -0.266713;
			case 12:if(!imag) return 0.956940;
			else return -0.290285;
			case 13:if(!imag) return 0.949528;
			else return -0.313682;
			case 14:if(!imag) return 0.941544;
			else return -0.336890;
			case 15:if(!imag) return 0.932993;
			else return -0.359895;
			case 16:if(!imag) return 0.923880;
			else return -0.382683;
			case 17:if(!imag) return 0.914210;
			else return -0.405241;
			case 18:if(!imag) return 0.903989;
			else return -0.427555;
			case 19:if(!imag) return 0.893224;
			else return -0.449611;
			case 20:if(!imag) return 0.881921;
			else return -0.471397;
			case 21:if(!imag) return 0.870087;
			else return -0.492898;
			case 22:if(!imag) return 0.857729;
			else return -0.514103;
			case 23:if(!imag) return 0.844854;
			else return -0.534998;
			case 24:if(!imag) return 0.831470;
			else return -0.555570;
			case 25:if(!imag) return 0.817585;
			else return -0.575808;
			case 26:if(!imag) return 0.803208;
			else return -0.595699;
			case 27:if(!imag) return 0.788346;
			else return -0.615232;
			case 28:if(!imag) return 0.773010;
			else return -0.634393;
			case 29:if(!imag) return 0.757209;
			else return -0.653173;
			case 30:if(!imag) return 0.740951;
			else return -0.671559;
			case 31:if(!imag) return 0.724247;
			else return -0.689541;
			case 32:if(!imag) return 0.707107;
			else return -0.707107;
			case 33:if(!imag) return 0.689541;
			else return -0.724247;
			case 34:if(!imag) return 0.671559;
			else return -0.740951;
			case 35:if(!imag) return 0.653173;
			else return -0.757209;
			case 36:if(!imag) return 0.634393;
			else return -0.773010;
			case 37:if(!imag) return 0.615232;
			else return -0.788346;
			case 38:if(!imag) return 0.595699;
			else return -0.803208;
			case 39:if(!imag) return 0.575808;
			else return -0.817585;
			case 40:if(!imag) return 0.555570;
			else return -0.831470;
			case 41:if(!imag) return 0.534998;
			else return -0.844854;
			case 42:if(!imag) return 0.514103;
			else return -0.857729;
			case 43:if(!imag) return 0.492898;
			else return -0.870087;
			case 44:if(!imag) return 0.471397;
			else return -0.881921;
			case 45:if(!imag) return 0.449611;
			else return -0.893224;
			case 46:if(!imag) return 0.427555;
			else return -0.903989;
			case 47:if(!imag) return 0.405241;
			else return -0.914210;
			case 48:if(!imag) return 0.382683;
			else return -0.923880;
			case 49:if(!imag) return 0.359895;
			else return -0.932993;
			case 50:if(!imag) return 0.336890;
			else return -0.941544;
			case 51:if(!imag) return 0.313682;
			else return -0.949528;
			case 52:if(!imag) return 0.290285;
			else return -0.956940;
			case 53:if(!imag) return 0.266713;
			else return -0.963776;
			case 54:if(!imag) return 0.242980;
			else return -0.970031;
			case 55:if(!imag) return 0.219101;
			else return -0.975702;
			case 56:if(!imag) return 0.195090;
			else return -0.980785;
			case 57:if(!imag) return 0.170962;
			else return -0.985278;
			case 58:if(!imag) return 0.146730;
			else return -0.989177;
			case 59:if(!imag) return 0.122411;
			else return -0.992480;
			case 60:if(!imag) return 0.098017;
			else return -0.995185;
			case 61:if(!imag) return 0.073565;
			else return -0.997290;
			case 62:if(!imag) return 0.049068;
			else return -0.998795;
			case 63:if(!imag) return 0.024541;
			else return -0.999699;
			case 64:if(!imag) return 0.000000;
			else return -1.000000;
			case 65:if(!imag) return -0.024541;
			else return -0.999699;
			case 66:if(!imag) return -0.049068;
			else return -0.998795;
			case 67:if(!imag) return -0.073565;
			else return -0.997290;
			case 68:if(!imag) return -0.098017;
			else return -0.995185;
			case 69:if(!imag) return -0.122411;
			else return -0.992480;
			case 70:if(!imag) return -0.146730;
			else return -0.989177;
			case 71:if(!imag) return -0.170962;
			else return -0.985278;
			case 72:if(!imag) return -0.195090;
			else return -0.980785;
			case 73:if(!imag) return -0.219101;
			else return -0.975702;
			case 74:if(!imag) return -0.242980;
			else return -0.970031;
			case 75:if(!imag) return -0.266713;
			else return -0.963776;
			case 76:if(!imag) return -0.290285;
			else return -0.956940;
			case 77:if(!imag) return -0.313682;
			else return -0.949528;
			case 78:if(!imag) return -0.336890;
			else return -0.941544;
			case 79:if(!imag) return -0.359895;
			else return -0.932993;
			case 80:if(!imag) return -0.382683;
			else return -0.923880;
			case 81:if(!imag) return -0.405241;
			else return -0.914210;
			case 82:if(!imag) return -0.427555;
			else return -0.903989;
			case 83:if(!imag) return -0.449611;
			else return -0.893224;
			case 84:if(!imag) return -0.471397;
			else return -0.881921;
			case 85:if(!imag) return -0.492898;
			else return -0.870087;
			case 86:if(!imag) return -0.514103;
			else return -0.857729;
			case 87:if(!imag) return -0.534998;
			else return -0.844854;
			case 88:if(!imag) return -0.555570;
			else return -0.831470;
			case 89:if(!imag) return -0.575808;
			else return -0.817585;
			case 90:if(!imag) return -0.595699;
			else return -0.803208;
			case 91:if(!imag) return -0.615232;
			else return -0.788346;
			case 92:if(!imag) return -0.634393;
			else return -0.773010;
			case 93:if(!imag) return -0.653173;
			else return -0.757209;
			case 94:if(!imag) return -0.671559;
			else return -0.740951;
			case 95:if(!imag) return -0.689541;
			else return -0.724247;
			case 96:if(!imag) return -0.707107;
			else return -0.707107;
			case 97:if(!imag) return -0.724247;
			else return -0.689541;
			case 98:if(!imag) return -0.740951;
			else return -0.671559;
			case 99:if(!imag) return -0.757209;
			else return -0.653173;
			case 100:if(!imag) return -0.773010;
			else return -0.634393;
			case 101:if(!imag) return -0.788346;
			else return -0.615232;
			case 102:if(!imag) return -0.803208;
			else return -0.595699;
			case 103:if(!imag) return -0.817585;
			else return -0.575808;
			case 104:if(!imag) return -0.831470;
			else return -0.555570;
			case 105:if(!imag) return -0.844854;
			else return -0.534998;
			case 106:if(!imag) return -0.857729;
			else return -0.514103;
			case 107:if(!imag) return -0.870087;
			else return -0.492898;
			case 108:if(!imag) return -0.881921;
			else return -0.471397;
			case 109:if(!imag) return -0.893224;
			else return -0.449611;
			case 110:if(!imag) return -0.903989;
			else return -0.427555;
			case 111:if(!imag) return -0.914210;
			else return -0.405241;
			case 112:if(!imag) return -0.923880;
			else return -0.382683;
			case 113:if(!imag) return -0.932993;
			else return -0.359895;
			case 114:if(!imag) return -0.941544;
			else return -0.336890;
			case 115:if(!imag) return -0.949528;
			else return -0.313682;
			case 116:if(!imag) return -0.956940;
			else return -0.290285;
			case 117:if(!imag) return -0.963776;
			else return -0.266713;
			case 118:if(!imag) return -0.970031;
			else return -0.242980;
			case 119:if(!imag) return -0.975702;
			else return -0.219101;
			case 120:if(!imag) return -0.980785;
			else return -0.195090;
			case 121:if(!imag) return -0.985278;
			else return -0.170962;
			case 122:if(!imag) return -0.989177;
			else return -0.146730;
			case 123:if(!imag) return -0.992480;
			else return -0.122411;
			case 124:if(!imag) return -0.995185;
			else return -0.098017;
			case 125:if(!imag) return -0.997290;
			else return -0.073565;
			case 126:if(!imag) return -0.998795;
			else return -0.049068;
			case 127:if(!imag) return -0.999699;
			else return -0.024541;
			}
		case 8:
			switch(level){
			case 0:if(!imag) return 1.000000;
			else return 0.000000;
			case 1:if(!imag) return 0.999925;
			else return -0.012272;
			case 2:if(!imag) return 0.999699;
			else return -0.024541;
			case 3:if(!imag) return 0.999322;
			else return -0.036807;
			case 4:if(!imag) return 0.998795;
			else return -0.049068;
			case 5:if(!imag) return 0.998118;
			else return -0.061321;
			case 6:if(!imag) return 0.997290;
			else return -0.073565;
			case 7:if(!imag) return 0.996313;
			else return -0.085797;
			case 8:if(!imag) return 0.995185;
			else return -0.098017;
			case 9:if(!imag) return 0.993907;
			else return -0.110222;
			case 10:if(!imag) return 0.992480;
			else return -0.122411;
			case 11:if(!imag) return 0.990903;
			else return -0.134581;
			case 12:if(!imag) return 0.989177;
			else return -0.146730;
			case 13:if(!imag) return 0.987301;
			else return -0.158858;
			case 14:if(!imag) return 0.985278;
			else return -0.170962;
			case 15:if(!imag) return 0.983105;
			else return -0.183040;
			case 16:if(!imag) return 0.980785;
			else return -0.195090;
			case 17:if(!imag) return 0.978317;
			else return -0.207111;
			case 18:if(!imag) return 0.975702;
			else return -0.219101;
			case 19:if(!imag) return 0.972940;
			else return -0.231058;
			case 20:if(!imag) return 0.970031;
			else return -0.242980;
			case 21:if(!imag) return 0.966976;
			else return -0.254866;
			case 22:if(!imag) return 0.963776;
			else return -0.266713;
			case 23:if(!imag) return 0.960431;
			else return -0.278520;
			case 24:if(!imag) return 0.956940;
			else return -0.290285;
			case 25:if(!imag) return 0.953306;
			else return -0.302006;
			case 26:if(!imag) return 0.949528;
			else return -0.313682;
			case 27:if(!imag) return 0.945607;
			else return -0.325310;
			case 28:if(!imag) return 0.941544;
			else return -0.336890;
			case 29:if(!imag) return 0.937339;
			else return -0.348419;
			case 30:if(!imag) return 0.932993;
			else return -0.359895;
			case 31:if(!imag) return 0.928506;
			else return -0.371317;
			case 32:if(!imag) return 0.923880;
			else return -0.382683;
			case 33:if(!imag) return 0.919114;
			else return -0.393992;
			case 34:if(!imag) return 0.914210;
			else return -0.405241;
			case 35:if(!imag) return 0.909168;
			else return -0.416430;
			case 36:if(!imag) return 0.903989;
			else return -0.427555;
			case 37:if(!imag) return 0.898674;
			else return -0.438616;
			case 38:if(!imag) return 0.893224;
			else return -0.449611;
			case 39:if(!imag) return 0.887640;
			else return -0.460539;
			case 40:if(!imag) return 0.881921;
			else return -0.471397;
			case 41:if(!imag) return 0.876070;
			else return -0.482184;
			case 42:if(!imag) return 0.870087;
			else return -0.492898;
			case 43:if(!imag) return 0.863973;
			else return -0.503538;
			case 44:if(!imag) return 0.857729;
			else return -0.514103;
			case 45:if(!imag) return 0.851355;
			else return -0.524590;
			case 46:if(!imag) return 0.844854;
			else return -0.534998;
			case 47:if(!imag) return 0.838225;
			else return -0.545325;
			case 48:if(!imag) return 0.831470;
			else return -0.555570;
			case 49:if(!imag) return 0.824589;
			else return -0.565732;
			case 50:if(!imag) return 0.817585;
			else return -0.575808;
			case 51:if(!imag) return 0.810457;
			else return -0.585798;
			case 52:if(!imag) return 0.803208;
			else return -0.595699;
			case 53:if(!imag) return 0.795837;
			else return -0.605511;
			case 54:if(!imag) return 0.788346;
			else return -0.615232;
			case 55:if(!imag) return 0.780737;
			else return -0.624859;
			case 56:if(!imag) return 0.773010;
			else return -0.634393;
			case 57:if(!imag) return 0.765167;
			else return -0.643832;
			case 58:if(!imag) return 0.757209;
			else return -0.653173;
			case 59:if(!imag) return 0.749136;
			else return -0.662416;
			case 60:if(!imag) return 0.740951;
			else return -0.671559;
			case 61:if(!imag) return 0.732654;
			else return -0.680601;
			case 62:if(!imag) return 0.724247;
			else return -0.689541;
			case 63:if(!imag) return 0.715731;
			else return -0.698376;
			case 64:if(!imag) return 0.707107;
			else return -0.707107;
			case 65:if(!imag) return 0.698376;
			else return -0.715731;
			case 66:if(!imag) return 0.689541;
			else return -0.724247;
			case 67:if(!imag) return 0.680601;
			else return -0.732654;
			case 68:if(!imag) return 0.671559;
			else return -0.740951;
			case 69:if(!imag) return 0.662416;
			else return -0.749136;
			case 70:if(!imag) return 0.653173;
			else return -0.757209;
			case 71:if(!imag) return 0.643832;
			else return -0.765167;
			case 72:if(!imag) return 0.634393;
			else return -0.773010;
			case 73:if(!imag) return 0.624859;
			else return -0.780737;
			case 74:if(!imag) return 0.615232;
			else return -0.788346;
			case 75:if(!imag) return 0.605511;
			else return -0.795837;
			case 76:if(!imag) return 0.595699;
			else return -0.803208;
			case 77:if(!imag) return 0.585798;
			else return -0.810457;
			case 78:if(!imag) return 0.575808;
			else return -0.817585;
			case 79:if(!imag) return 0.565732;
			else return -0.824589;
			case 80:if(!imag) return 0.555570;
			else return -0.831470;
			case 81:if(!imag) return 0.545325;
			else return -0.838225;
			case 82:if(!imag) return 0.534998;
			else return -0.844854;
			case 83:if(!imag) return 0.524590;
			else return -0.851355;
			case 84:if(!imag) return 0.514103;
			else return -0.857729;
			case 85:if(!imag) return 0.503538;
			else return -0.863973;
			case 86:if(!imag) return 0.492898;
			else return -0.870087;
			case 87:if(!imag) return 0.482184;
			else return -0.876070;
			case 88:if(!imag) return 0.471397;
			else return -0.881921;
			case 89:if(!imag) return 0.460539;
			else return -0.887640;
			case 90:if(!imag) return 0.449611;
			else return -0.893224;
			case 91:if(!imag) return 0.438616;
			else return -0.898674;
			case 92:if(!imag) return 0.427555;
			else return -0.903989;
			case 93:if(!imag) return 0.416430;
			else return -0.909168;
			case 94:if(!imag) return 0.405241;
			else return -0.914210;
			case 95:if(!imag) return 0.393992;
			else return -0.919114;
			case 96:if(!imag) return 0.382683;
			else return -0.923880;
			case 97:if(!imag) return 0.371317;
			else return -0.928506;
			case 98:if(!imag) return 0.359895;
			else return -0.932993;
			case 99:if(!imag) return 0.348419;
			else return -0.937339;
			case 100:if(!imag) return 0.336890;
			else return -0.941544;
			case 101:if(!imag) return 0.325310;
			else return -0.945607;
			case 102:if(!imag) return 0.313682;
			else return -0.949528;
			case 103:if(!imag) return 0.302006;
			else return -0.953306;
			case 104:if(!imag) return 0.290285;
			else return -0.956940;
			case 105:if(!imag) return 0.278520;
			else return -0.960431;
			case 106:if(!imag) return 0.266713;
			else return -0.963776;
			case 107:if(!imag) return 0.254866;
			else return -0.966976;
			case 108:if(!imag) return 0.242980;
			else return -0.970031;
			case 109:if(!imag) return 0.231058;
			else return -0.972940;
			case 110:if(!imag) return 0.219101;
			else return -0.975702;
			case 111:if(!imag) return 0.207111;
			else return -0.978317;
			case 112:if(!imag) return 0.195090;
			else return -0.980785;
			case 113:if(!imag) return 0.183040;
			else return -0.983105;
			case 114:if(!imag) return 0.170962;
			else return -0.985278;
			case 115:if(!imag) return 0.158858;
			else return -0.987301;
			case 116:if(!imag) return 0.146730;
			else return -0.989177;
			case 117:if(!imag) return 0.134581;
			else return -0.990903;
			case 118:if(!imag) return 0.122411;
			else return -0.992480;
			case 119:if(!imag) return 0.110222;
			else return -0.993907;
			case 120:if(!imag) return 0.098017;
			else return -0.995185;
			case 121:if(!imag) return 0.085797;
			else return -0.996313;
			case 122:if(!imag) return 0.073565;
			else return -0.997290;
			case 123:if(!imag) return 0.061321;
			else return -0.998118;
			case 124:if(!imag) return 0.049068;
			else return -0.998795;
			case 125:if(!imag) return 0.036807;
			else return -0.999322;
			case 126:if(!imag) return 0.024541;
			else return -0.999699;
			case 127:if(!imag) return 0.012272;
			else return -0.999925;
			case 128:if(!imag) return 0.000000;
			else return -1.000000;
			case 129:if(!imag) return -0.012272;
			else return -0.999925;
			case 130:if(!imag) return -0.024541;
			else return -0.999699;
			case 131:if(!imag) return -0.036807;
			else return -0.999322;
			case 132:if(!imag) return -0.049068;
			else return -0.998795;
			case 133:if(!imag) return -0.061321;
			else return -0.998118;
			case 134:if(!imag) return -0.073565;
			else return -0.997290;
			case 135:if(!imag) return -0.085797;
			else return -0.996313;
			case 136:if(!imag) return -0.098017;
			else return -0.995185;
			case 137:if(!imag) return -0.110222;
			else return -0.993907;
			case 138:if(!imag) return -0.122411;
			else return -0.992480;
			case 139:if(!imag) return -0.134581;
			else return -0.990903;
			case 140:if(!imag) return -0.146730;
			else return -0.989177;
			case 141:if(!imag) return -0.158858;
			else return -0.987301;
			case 142:if(!imag) return -0.170962;
			else return -0.985278;
			case 143:if(!imag) return -0.183040;
			else return -0.983105;
			case 144:if(!imag) return -0.195090;
			else return -0.980785;
			case 145:if(!imag) return -0.207111;
			else return -0.978317;
			case 146:if(!imag) return -0.219101;
			else return -0.975702;
			case 147:if(!imag) return -0.231058;
			else return -0.972940;
			case 148:if(!imag) return -0.242980;
			else return -0.970031;
			case 149:if(!imag) return -0.254866;
			else return -0.966976;
			case 150:if(!imag) return -0.266713;
			else return -0.963776;
			case 151:if(!imag) return -0.278520;
			else return -0.960431;
			case 152:if(!imag) return -0.290285;
			else return -0.956940;
			case 153:if(!imag) return -0.302006;
			else return -0.953306;
			case 154:if(!imag) return -0.313682;
			else return -0.949528;
			case 155:if(!imag) return -0.325310;
			else return -0.945607;
			case 156:if(!imag) return -0.336890;
			else return -0.941544;
			case 157:if(!imag) return -0.348419;
			else return -0.937339;
			case 158:if(!imag) return -0.359895;
			else return -0.932993;
			case 159:if(!imag) return -0.371317;
			else return -0.928506;
			case 160:if(!imag) return -0.382683;
			else return -0.923880;
			case 161:if(!imag) return -0.393992;
			else return -0.919114;
			case 162:if(!imag) return -0.405241;
			else return -0.914210;
			case 163:if(!imag) return -0.416430;
			else return -0.909168;
			case 164:if(!imag) return -0.427555;
			else return -0.903989;
			case 165:if(!imag) return -0.438616;
			else return -0.898674;
			case 166:if(!imag) return -0.449611;
			else return -0.893224;
			case 167:if(!imag) return -0.460539;
			else return -0.887640;
			case 168:if(!imag) return -0.471397;
			else return -0.881921;
			case 169:if(!imag) return -0.482184;
			else return -0.876070;
			case 170:if(!imag) return -0.492898;
			else return -0.870087;
			case 171:if(!imag) return -0.503538;
			else return -0.863973;
			case 172:if(!imag) return -0.514103;
			else return -0.857729;
			case 173:if(!imag) return -0.524590;
			else return -0.851355;
			case 174:if(!imag) return -0.534998;
			else return -0.844854;
			case 175:if(!imag) return -0.545325;
			else return -0.838225;
			case 176:if(!imag) return -0.555570;
			else return -0.831470;
			case 177:if(!imag) return -0.565732;
			else return -0.824589;
			case 178:if(!imag) return -0.575808;
			else return -0.817585;
			case 179:if(!imag) return -0.585798;
			else return -0.810457;
			case 180:if(!imag) return -0.595699;
			else return -0.803208;
			case 181:if(!imag) return -0.605511;
			else return -0.795837;
			case 182:if(!imag) return -0.615232;
			else return -0.788346;
			case 183:if(!imag) return -0.624859;
			else return -0.780737;
			case 184:if(!imag) return -0.634393;
			else return -0.773010;
			case 185:if(!imag) return -0.643832;
			else return -0.765167;
			case 186:if(!imag) return -0.653173;
			else return -0.757209;
			case 187:if(!imag) return -0.662416;
			else return -0.749136;
			case 188:if(!imag) return -0.671559;
			else return -0.740951;
			case 189:if(!imag) return -0.680601;
			else return -0.732654;
			case 190:if(!imag) return -0.689541;
			else return -0.724247;
			case 191:if(!imag) return -0.698376;
			else return -0.715731;
			case 192:if(!imag) return -0.707107;
			else return -0.707107;
			case 193:if(!imag) return -0.715731;
			else return -0.698376;
			case 194:if(!imag) return -0.724247;
			else return -0.689541;
			case 195:if(!imag) return -0.732654;
			else return -0.680601;
			case 196:if(!imag) return -0.740951;
			else return -0.671559;
			case 197:if(!imag) return -0.749136;
			else return -0.662416;
			case 198:if(!imag) return -0.757209;
			else return -0.653173;
			case 199:if(!imag) return -0.765167;
			else return -0.643832;
			case 200:if(!imag) return -0.773010;
			else return -0.634393;
			case 201:if(!imag) return -0.780737;
			else return -0.624859;
			case 202:if(!imag) return -0.788346;
			else return -0.615232;
			case 203:if(!imag) return -0.795837;
			else return -0.605511;
			case 204:if(!imag) return -0.803208;
			else return -0.595699;
			case 205:if(!imag) return -0.810457;
			else return -0.585798;
			case 206:if(!imag) return -0.817585;
			else return -0.575808;
			case 207:if(!imag) return -0.824589;
			else return -0.565732;
			case 208:if(!imag) return -0.831470;
			else return -0.555570;
			case 209:if(!imag) return -0.838225;
			else return -0.545325;
			case 210:if(!imag) return -0.844854;
			else return -0.534998;
			case 211:if(!imag) return -0.851355;
			else return -0.524590;
			case 212:if(!imag) return -0.857729;
			else return -0.514103;
			case 213:if(!imag) return -0.863973;
			else return -0.503538;
			case 214:if(!imag) return -0.870087;
			else return -0.492898;
			case 215:if(!imag) return -0.876070;
			else return -0.482184;
			case 216:if(!imag) return -0.881921;
			else return -0.471397;
			case 217:if(!imag) return -0.887640;
			else return -0.460539;
			case 218:if(!imag) return -0.893224;
			else return -0.449611;
			case 219:if(!imag) return -0.898674;
			else return -0.438616;
			case 220:if(!imag) return -0.903989;
			else return -0.427555;
			case 221:if(!imag) return -0.909168;
			else return -0.416430;
			case 222:if(!imag) return -0.914210;
			else return -0.405241;
			case 223:if(!imag) return -0.919114;
			else return -0.393992;
			case 224:if(!imag) return -0.923880;
			else return -0.382683;
			case 225:if(!imag) return -0.928506;
			else return -0.371317;
			case 226:if(!imag) return -0.932993;
			else return -0.359895;
			case 227:if(!imag) return -0.937339;
			else return -0.348419;
			case 228:if(!imag) return -0.941544;
			else return -0.336890;
			case 229:if(!imag) return -0.945607;
			else return -0.325310;
			case 230:if(!imag) return -0.949528;
			else return -0.313682;
			case 231:if(!imag) return -0.953306;
			else return -0.302006;
			case 232:if(!imag) return -0.956940;
			else return -0.290285;
			case 233:if(!imag) return -0.960431;
			else return -0.278520;
			case 234:if(!imag) return -0.963776;
			else return -0.266713;
			case 235:if(!imag) return -0.966976;
			else return -0.254866;
			case 236:if(!imag) return -0.970031;
			else return -0.242980;
			case 237:if(!imag) return -0.972940;
			else return -0.231058;
			case 238:if(!imag) return -0.975702;
			else return -0.219101;
			case 239:if(!imag) return -0.978317;
			else return -0.207111;
			case 240:if(!imag) return -0.980785;
			else return -0.195090;
			case 241:if(!imag) return -0.983105;
			else return -0.183040;
			case 242:if(!imag) return -0.985278;
			else return -0.170962;
			case 243:if(!imag) return -0.987301;
			else return -0.158858;
			case 244:if(!imag) return -0.989177;
			else return -0.146730;
			case 245:if(!imag) return -0.990903;
			else return -0.134581;
			case 246:if(!imag) return -0.992480;
			else return -0.122411;
			case 247:if(!imag) return -0.993907;
			else return -0.110222;
			case 248:if(!imag) return -0.995185;
			else return -0.098017;
			case 249:if(!imag) return -0.996313;
			else return -0.085797;
			case 250:if(!imag) return -0.997290;
			else return -0.073565;
			case 251:if(!imag) return -0.998118;
			else return -0.061321;
			case 252:if(!imag) return -0.998795;
			else return -0.049068;
			case 253:if(!imag) return -0.999322;
			else return -0.036807;
			case 254:if(!imag) return -0.999699;
			else return -0.024541;
			case 255:if(!imag) return -0.999925;
			else return -0.012272;
			}
		}
		return 0;
	}
}
