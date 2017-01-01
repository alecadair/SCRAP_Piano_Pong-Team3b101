
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.StringTokenizer;

public class scrapAssembler {

	private static HashMap<String, Integer> labelMap = new HashMap<String, Integer>();
	private static LinkedList<String> labelOrder = new LinkedList<String>();
	private static int mostRecentLineCount = 0;

	// memory and register properties:
	private static long lastAddressLocation = 1024;
	private static String jumpAddressRegister = "R14";
	private static String jumpTableRegister = "R13";

	/**
	 * Two pass: First Pass- Find Labels, put them in Maps. Second Pass- create
	 * jump table first, then Create binary, replacing label jumps with two line
	 * load-jump combinations.
	 * 
	 * @param incomingText
	 * @return
	 */
	public static String toBinary(String incomingText) {
		// First Pass:
		findLabelAddresses(incomingText);
		String completedBinary = createJumpTable();

		// Second Pass:
		completedBinary = parseBodyOfBinary(incomingText, completedBinary);

		// clear data before return:
		labelOrder.clear();
		labelMap.clear();
		mostRecentLineCount = 0;

		// return the string that shows up in Binary window:
		return completedBinary;
	}

	private static void findLabelAddresses(String incomingText) {
		String nextLine = "";
		Scanner assemblyScanner = new Scanner(incomingText);
		while (assemblyScanner.hasNext()) {
			// Ignore comments and put them in the binary as is:'
			nextLine = assemblyScanner.nextLine();
			if (nextLine.startsWith("//")) {
			}
			else if (nextLine.startsWith(".")) {
				labelMap.put(nextLine.substring(1), mostRecentLineCount);
				//mostRecentLineCount++;
			}
			else {
				if (nextLine.equals("")) {
				}
				else if (nextLine.split("\\s").length == 5){
					mostRecentLineCount += 4;
				}
				// no comments, so just parse:
				else {
					mostRecentLineCount++;
				}
			}
		}
		assemblyScanner.close();
	}

	/**
	 * Reads the HashMap and create the jump table
	 * 
	 * @return
	 */
	private static String createJumpTable() {
		int labelCount = labelMap.size();
		String completedBinary = "";
		// if labelCount > 0 then a jump table is required:
		if (labelCount > 0) {
			completedBinary += "//START Jump Table:\n//NOTE: "
					+ jumpAddressRegister + " AND "+ jumpTableRegister + " USED FOR JUMPING\n";
			// iterate through the HashMap and create a jump table line for each
			// entry:
			for (String thisEntry : labelMap.keySet()) {
				String thisBinaryUnderscored = "";
				String signExtension = "";
				String thisBinary = Integer
						.toBinaryString((labelMap.get(thisEntry)) + labelCount); // label's
																					// address
																					// in
																					// binary
				// zero-extend label's address:
				if (thisBinary.length() < 16) {
					int extendCount = 16 - thisBinary.length();
					while (extendCount > 0) {
						signExtension += "0";
						extendCount--;
					}
					thisBinary = signExtension + thisBinary;
					// add underscores for readability:
					thisBinaryUnderscored = thisBinary.substring(0, 4) + "_"
							+ thisBinary.substring(4, 8) + "_"
							+ thisBinary.substring(8, 12) + "_"
							+ thisBinary.substring(12, 16);
					completedBinary += thisBinaryUnderscored;
					// add comment for readability:
					completedBinary += "\t//Address of label '" + thisEntry
							+ "' at line "
							+ ((labelMap.get(thisEntry)) + labelCount) + "\n";
					labelOrder.add(thisEntry.toUpperCase());

				}
			}
			/*
			 * program starts after jumptable, which is the same as labelCount
			 * since java's .size() starts counting at one while verilog's
			 * readmem starts counting at zero
			 */
			completedBinary += "//END Jump Table\n\n\n//PROGRAM START LINE (I.E., SET PC INITIALIZATION TO):  "
					+ labelCount + "\n";
		}
		return completedBinary;
	}

	/**
	 * @param incomingText
	 * @param completedBinary
	 * @return
	 */
	private static String parseBodyOfBinary(String incomingText,
			String completedBinary) {
		String nextLine;
		Scanner assemblyScanner;
		nextLine = "";
		assemblyScanner = new Scanner(incomingText);
		while (assemblyScanner.hasNext()) {
			// Ignore comments and put them in the binary as is:'
			nextLine = assemblyScanner.nextLine();
			if (nextLine.startsWith("//")) {
				completedBinary += nextLine + "\n";
			}
			else if (nextLine.startsWith("@")) {
				completedBinary += nextLine;
			}
			else if (nextLine.startsWith(".")) {
				completedBinary += "//" + nextLine + "\n";
			}
			else {
				// ignore comments on individual lines, add it to line comments:
				if (nextLine.contains("//")) {
					int commentIndex = nextLine.indexOf("//");
					completedBinary += createInstructionBinary(
							nextLine.toUpperCase().substring(0, commentIndex))
							+ "; " + nextLine.substring(commentIndex + 2)
							+ "\n";
				}
				// blank line:
				else if (nextLine.equals("")) {
					completedBinary += "\n";
				}
				// no comments, so just parse:
				else {
					completedBinary += createInstructionBinary(
							nextLine.toUpperCase()) + "\n";
				}
			}
		}
		assemblyScanner.close();
		return completedBinary;
	}

	/**
	 * For each instruction, this method reads the operation, register, and
	 * immediates and returns the 16 bit binary code
	 * 
	 * @param thisToken
	 * @return
	 */
	private static String createInstructionBinary(String thisToken) {
		Scanner thisLineScanner = new Scanner(thisToken);
		thisLineScanner.useDelimiter(" ");
		String instruction = null;
		String rdest = null;
		String rsrc = null;
		String raddr = null;
		String rammount = null;
		String condition = null;
		String displacement = null;
		String rtarget = null;
		String immediate = null;
		String label = null;
		String instructionInBinary = null;
		while (thisLineScanner.hasNext()) {
			// If this line is an r-type instruction:
			if (thisLineScanner.hasNext("ADD")
					|| thisLineScanner.hasNext("ADDU")
					|| thisLineScanner.hasNext("SUB")
					|| thisLineScanner.hasNext("CMP")
					|| thisLineScanner.hasNext("AND")
					|| thisLineScanner.hasNext("OR")
					|| thisLineScanner.hasNext("XOR")
					|| thisLineScanner.hasNext("MOV")) {
				instruction = thisLineScanner.next();
				rsrc = thisLineScanner.next();
				rdest = thisLineScanner.next();
				instructionInBinary = translateRType(instruction, rsrc, rdest);
				instructionInBinary += "\t//" + instruction + " " + rsrc + " "
						+ rdest;
			}
			// If this line is a shift:
			else if (thisLineScanner.hasNext("LSH")
					|| thisLineScanner.hasNext("ASHU")) {
				instruction = thisLineScanner.next();
				rammount = thisLineScanner.next();
				rdest = thisLineScanner.next();
				rsrc = rdest;
				instructionInBinary = translateShiftType(instruction, rammount,
						rdest);
				instructionInBinary += "\t//" + instruction + " " + rammount
						+ " " + rdest;
			}
			// If this line is a load or store:
			else if (thisLineScanner.hasNext("LOAD")
					|| thisLineScanner.hasNext("STOR")) {
				instruction = thisLineScanner.next();
				rdest = thisLineScanner.next();
				raddr = thisLineScanner.next();
				instructionInBinary = translateLoadStoreType(instruction, rdest,
						raddr);
				instructionInBinary += "\t//" + instruction + " " + rdest + " "
						+ raddr;
			}
			// If this line is an i-type:
			else if (thisLineScanner.hasNext("ADDI")
					|| thisLineScanner.hasNext("ADDUI")
					|| thisLineScanner.hasNext("SUBI")
					|| thisLineScanner.hasNext("CMPI")
					|| thisLineScanner.hasNext("ANDI")
					|| thisLineScanner.hasNext("ORI")
					|| thisLineScanner.hasNext("XORI")
					|| thisLineScanner.hasNext("MOVI")) {
				instruction = thisLineScanner.next();
				immediate = thisLineScanner.next();
				rdest = thisLineScanner.next();
				instructionInBinary = translateIType(instruction, immediate,
						rdest);
				instructionInBinary += "\t//" + instruction + " " + immediate
						+ " " + rdest;
			}
			// If this type is a branch:
			else if (thisLineScanner.hasNext("BCOND")) {
				instruction = thisLineScanner.next();
				condition = thisLineScanner.next();
				displacement = thisLineScanner.next();
				instructionInBinary = translateBcond(instruction, condition,
						displacement);
				instructionInBinary += "\t//" + instruction + " " + condition
						+ " " + displacement;
			}
			else if (thisLineScanner.hasNext("JCOND")) {
				String[] jcondTokens = thisToken.split("\\s");
				if (jcondTokens.length == 5){
					instruction = thisLineScanner.next();
					label = thisLineScanner.next();
					rsrc = thisLineScanner.next();
					rdest = thisLineScanner.next();
					condition = thisLineScanner.next();
					instructionInBinary = translateJcondLabel(instruction, label, rsrc, rdest, condition);
				}
				else{
					instruction = thisLineScanner.next();
					condition = thisLineScanner.next();
					rtarget = thisLineScanner.next();
					instructionInBinary = translateJcond(instruction, condition,
							rtarget);
					instructionInBinary += "\t//" + instruction + " " + rtarget
							+ " if " + condition;
				}
			}
			else if (thisLineScanner.hasNext("WAIT")) {
				thisLineScanner.next();
				instructionInBinary = "0000_0000_0000_0000";
			}
			// Not a recognized instruction.
			else {
				instructionInBinary = ("This instruction is not recognized: "
						+ thisLineScanner.nextLine());
			}
		}
		thisLineScanner.close();
		return (instructionInBinary);
	}

	/**
	 * Creates the R-Type instruction in RISC ISA for EECS 427 Processor bit
	 * format.
	 * 
	 * @param instruction
	 *            Mnemonic instruction name
	 * @param rsrc
	 *            Rsrc becomes bits 3:0
	 * @param rdest
	 *            Rdest becomes bits 11:8
	 * @return the full 16bit binary representation of the R-type instruction.
	 */
	private static String translateRType(String instruction, String rsrc,
			String rdest) {
		// Bits 15-12 are always the same:
		String bits = "0000_";
		// Bits 11-8 are rdest:
		bits += registerToBinary(rdest) + "_";
		// Bits 7-4 are OP Code extension
		if (instruction.equals("ADD")) {
			bits += "0101_";
		}
		if (instruction.equals("ADDU")) {
			bits += "0110_";
		}
		if (instruction.equals("SUB")) {
			bits += "1001_";
		}
		if (instruction.equals("CMP")) {
			bits += "1011_";
		}
		if (instruction.equals("AND")) {
			bits += "0001_";
		}
		if (instruction.equals("OR")) {
			bits += "0010_";
		}
		if (instruction.equals("XOR")) {
			bits += "0011_";
		}
		if (instruction.equals("MOV")) {
			bits += "1101_";
		}
		// Bits 3-0 are Rsrc
		bits += registerToBinary(rsrc);

		return bits;
	}

	private static String translateJcond(String instruction, String condition,
			String rtarget) {

		String bits = "";
		// bits 15-12 are OP Code:
		bits += "0100_";
		// bits 11-8 are condition code:
		bits += getConditionCodeInBinary(condition)+"_";
		// bits 7-4 are op code ext:
		bits += "1100_";
		// bits 3-0 are rtarget:
		bits += registerToBinary(rtarget);
		return bits;
	}

	private static String translateJcondLabel(String instruction, String label,
			String rsrc, String rdest, String condition) {
		String bits = "";
		//requires four lines of code:
		//1. movi mem[loopHerePointer] [rx]
		bits += "1101_";
		bits += registerToBinary(jumpTableRegister)+"_";
		String indexOfLabelInBinary = Integer.toBinaryString(labelOrder.indexOf(label.toUpperCase()));
		if (indexOfLabelInBinary.length()<8){
			while (indexOfLabelInBinary.length()<8){
				indexOfLabelInBinary = "0" + indexOfLabelInBinary;
			}	
		}
		bits += indexOfLabelInBinary.substring(0,4)+"_"+indexOfLabelInBinary.substring(4);
		bits += "\t// MOVI \n";
		//2. load [ry] [rx]
		bits += "0100_";
		bits += registerToBinary(jumpAddressRegister);
		bits += "_0000_";
		bits += registerToBinary(jumpTableRegister);
		bits += "\t// LOAD \n";
		//3. comp [rsrc] [rdest]
		if(rsrc.startsWith("R") && rdest.startsWith("R")){
			bits += "0000_";
			bits += registerToBinary(rsrc);
			bits += "_1011_";
			bits += registerToBinary(rdest);
		}
		else if(!rsrc.startsWith("R") && !rdest.startsWith("R")){
			bits+= "looks like two immediates; This needs at least one reg or to be done manually.";
		}
		else if(rsrc.startsWith("R")){
			bits+="1011_";
			bits += registerToBinary(rsrc)+"_";
			bits += smallImmediateToBinary(rdest);	
		}
		else if(rdest.startsWith("R")){
			bits+="1011_";
			bits += registerToBinary(rdest)+"_";
			bits += smallImmediateToBinary(rsrc);
		}
		bits += "\t// CMP \n";
		//4. jcond [condition] [rx]
		bits += "0100_";
		bits += getConditionCodeInBinary(condition);
		bits += "_1100_";
		bits += registerToBinary(jumpAddressRegister);
		bits += "\t// JCOND \n";
		return bits;
	}

	private static String translateBcond(String instruction, String condition,
			String displacement) {
		String bits = "";
		// bits 15-12 are OP Code:
		bits += "1100_";
		// bits 11-8 are condition code:
		bits += getConditionCodeInBinary(condition) + "_";
		// bits 7-0 are 2C's displacement:
		String binaryDisplacement = Integer
				.toBinaryString(Integer.parseInt(displacement));
		// signextend positive binaryImmediates:
		if (binaryDisplacement.length() < 8) {
			int signExtensionLength = 8 - binaryDisplacement.length();
			String signExtension = "";
			for (int i = 0; i < signExtensionLength; i++) {
				signExtension += "0";
			}
			binaryDisplacement = signExtension + binaryDisplacement;
		}
		// truncate negative binary numbers from 32 bit to 8 bit:
		if (displacement.startsWith("-")) {
			binaryDisplacement = binaryDisplacement.substring(24);
		}
		bits += binaryDisplacement;
		return bits;
	}

	/**
	 * @param instruction
	 * @param immediate
	 * @param rdest
	 * @return
	 */
	private static String translateIType(String instruction, String immediate,
			String rdest) {
		String bits = "";
		// bits 15-12 change based on the instruction:
		if (instruction.equals("ADDI")) {
			bits += "0101_";
		}
		if (instruction.equals("ADDUI")) {
			bits += "0110_";
		}
		if (instruction.equals("CMPI")) {
			bits += "1011_";
		}
		if (instruction.equals("ANDI")) {
			bits += "0001_";
		}
		if (instruction.equals("ORI")) {
			bits += "0010_";
		}
		if (instruction.equals("XORI")) {
			bits += "0011_";
		}
		if (instruction.equals("MOVI")) {
			bits += "1101_";
		}
		if (instruction.equals("SUBI")){
			bits += "1001_";
		}
		// bits 11-7 are rdest:
		bits += registerToBinary(rdest) + "_";
		// bits 6-0 are the immediate
		String binaryImmediate = Integer
				.toBinaryString(Integer.parseInt(immediate));
		// signextend positive binaryImmediates:
		if (binaryImmediate.length() < 8) {
			int signExtensionLength = 8 - binaryImmediate.length();
			String signExtension = "";
			for (int i = 0; i < signExtensionLength; i++) {
				signExtension += "0";
			}
			binaryImmediate = signExtension + binaryImmediate;
		}
		// truncate negative binary numbers from 32 bit to 8 bit:
		if (immediate.startsWith("-")) {
			binaryImmediate = binaryImmediate.substring(24);
		}
		bits += binaryImmediate.substring(0, 4) + "_"
				+ binaryImmediate.substring(4);
		return bits;
	}

	/**
	 * Create the full 16bit binary representation of the memory instruction.
	 * 
	 * @param instruction
	 *            LOAD or STOR
	 * @param rdest
	 *            note rdest is rsrc for store, the register to load or store
	 *            from
	 * @param raddr
	 *            register containing memory address to load from or store to.
	 * @return the full 16bit binary representation of the load or store
	 *         instruction.
	 */
	private static String translateLoadStoreType(String instruction,
			String rdest, String raddr) {
		// "rdest" is rsrc for store
		// bits 15-12 are always the same:
		String bits = "0100_";
		// bits 11-8 are rdest for LOAD and rsrc for STORE:
		bits += registerToBinary(raddr) + "_";
		// bits 7-4 distinguish load from store
		if (instruction.equals("LOAD")) {
			bits += "0000_";
		}
		else {
			bits += "0100_";
		}
		// bits 3-0 are the register with the address
		bits += registerToBinary(rdest);
		return bits;
	}

	/**
	 * Creates the shfit instructions in RISC ISA for EECS 427 Processor bit
	 * format.
	 * 
	 * @param instruction
	 *            LSH or ASH
	 * @param rammount
	 *            2s complement
	 * @param rdest
	 *            destination register
	 * @return the full 16bit binary representation of the LSH and ASHU
	 *         instruction.
	 */
	private static String translateShiftType(String instruction,
			String rammount, String rdest) {
		// Bits 15-12 are always the same:
		String bits = "1000_";
		// Bits 11-8 are Rdest:
		bits += registerToBinary(rdest) + "_";
		// bits 7-4 are OP code extension:
		if (instruction.equals("LSH")) {
			bits += "0100_";
		}
		if (instruction.equals("ASH")) {
			bits += "0110_";
		}
		// bits 3-0 are rammount:
		String binaryAmmount = registerToBinary(rammount);
		bits += binaryAmmount;

		return bits;
	}

	/**
	 * A helper method to translate register names into binary equivalent.
	 * 
	 * @param reg
	 *            incoming register R0-R15 only.
	 * @return binary representation of reg.
	 */
	private static String registerToBinary(String reg) {
		switch (reg) {
			case "R0" :
				return ("0000");
			case "R1" :
				return ("0001");
			case "R2" :
				return ("0010");
			case "R3" :
				return ("0011");
			case "R4" :
				return ("0100");
			case "R5" :
				return ("0101");
			case "R6" :
				return ("0110");
			case "R7" :
				return ("0111");
			case "R8" :
				return ("1000");
			case "R9" :
				return ("1001");
			case "R10" :
				return ("1010");
			case "R11" :
				return ("1011");
			case "R12" :
				return ("1100");
			case "R13" :
				return ("1101");
			case "R14" :
				return ("1110");
			case "R15" :
				return ("1111");
			default :
				return ("INVALID REGISTER: " + reg);
		}
	}

	private static String getConditionCodeInBinary(String condition) {
		switch (condition) {
			case "EQ" :
				return "0000";
			case "NE" :
				return "0001";
			case "GE" :
				return "1101";
			case "CS" :
				return "0010";
			case "CC" :
				return "0011";
			case "HI" :
				return "0100";
			case "LS" :
				return "0101";
			case "LO" :
				return "1010";
			case "HS" :
				return "1011";
			case "GT" :
				return "0110";
			case "LE" :
				return "0111";
			case "FS" :
				return "1000";
			case "FC" :
				return "1001";
			case "LT" :
				return "1100";

		}
		return null;
	}

	/**
	 * Converts a small immediate (between 0 and 255) to an 8 bit binary
	 * @param rsrc an immediate between 0 and 255
	 * @return 8 bit binary representation, otherwise an error message
	 */
	private static String smallImmediateToBinary(String rsrc) {
		int smallImmediate = Integer.parseInt(rsrc);
		String smallImmediateBinary = Integer.toBinaryString(smallImmediate);
		while(smallImmediateBinary.length()<8){
			smallImmediateBinary = "0"+smallImmediateBinary;
		}
		if(smallImmediate>255){
			smallImmediateBinary = "Need immediate "+smallImmediate+" to be between 0 and 255";
		}
		else{
			smallImmediateBinary = smallImmediateBinary.substring(0,4) + "_" + smallImmediateBinary.substring(4);
		}
		return smallImmediateBinary;
	}

	public static long getLastAddressLocation() {
		return lastAddressLocation;
	}

	public static void setLastAddressLocation(long lastAddressLocation) {
		scrapAssembler.lastAddressLocation = lastAddressLocation;
	}

	public static String getJumpAddressRegister() {
		return jumpAddressRegister;
	}

	public static void setJumpAddressRegister(String jumpAddressRegister) {
		scrapAssembler.jumpAddressRegister = jumpAddressRegister;
	}

	public static String getJumpTableRegister() {
		return jumpTableRegister;
	}

	public static void setJumpTableRegister(String jumpTableRegister) {
		scrapAssembler.jumpTableRegister = jumpTableRegister;
	}
	
	

}
