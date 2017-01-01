<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_26(15:0)" />
        <signal name="clk" />
        <signal name="reset" />
        <signal name="memOutEnA" />
        <signal name="aluResultEn" />
        <signal name="cin" />
        <signal name="immEn" />
        <signal name="memReadEn" />
        <signal name="memOutEnB" />
        <signal name="memEnA" />
        <signal name="memEnB" />
        <signal name="memWeA" />
        <signal name="memWeB" />
        <signal name="branchEn" />
        <signal name="jumpEn" />
        <signal name="PCen" />
        <signal name="pcAddrEn" />
        <signal name="regAddrEn" />
        <signal name="regEn(4:0)" />
        <signal name="aluOp(7:0)" />
        <signal name="bufEnA(4:0)" />
        <signal name="bufEnB(4:0)" />
        <signal name="imm(15:0)" />
        <signal name="branchOffsetImm5(9:0)" />
        <signal name="XLXN_27(0:15)" />
        <signal name="segment(0:3)" />
        <signal name="digit(0:7)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="reset" />
        <port polarity="Output" name="segment(0:3)" />
        <port polarity="Output" name="digit(0:7)" />
        <blockdef name="alu_reg_mem">
            <timestamp>2015-11-2T21:48:25</timestamp>
            <rect width="432" x="64" y="-1472" height="1472" />
            <line x2="0" y1="-1440" y2="-1440" x1="64" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1312" y2="-1312" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="496" y="-1452" height="24" />
            <line x2="560" y1="-1440" y2="-1440" x1="496" />
            <rect width="64" x="496" y="-1180" height="24" />
            <line x2="560" y1="-1168" y2="-1168" x1="496" />
            <rect width="64" x="496" y="-908" height="24" />
            <line x2="560" y1="-896" y2="-896" x1="496" />
            <rect width="64" x="496" y="-636" height="24" />
            <line x2="560" y1="-624" y2="-624" x1="496" />
            <rect width="64" x="496" y="-364" height="24" />
            <line x2="560" y1="-352" y2="-352" x1="496" />
            <rect width="64" x="496" y="-92" height="24" />
            <line x2="560" y1="-80" y2="-80" x1="496" />
        </blockdef>
        <blockdef name="ControlUnit">
            <timestamp>2015-11-2T21:48:31</timestamp>
            <rect width="400" x="64" y="-1408" height="1408" />
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-704" y2="-704" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="528" y1="-1376" y2="-1376" x1="464" />
            <line x2="528" y1="-1312" y2="-1312" x1="464" />
            <line x2="528" y1="-1248" y2="-1248" x1="464" />
            <line x2="528" y1="-1184" y2="-1184" x1="464" />
            <line x2="528" y1="-1120" y2="-1120" x1="464" />
            <line x2="528" y1="-1056" y2="-1056" x1="464" />
            <line x2="528" y1="-992" y2="-992" x1="464" />
            <line x2="528" y1="-928" y2="-928" x1="464" />
            <line x2="528" y1="-864" y2="-864" x1="464" />
            <line x2="528" y1="-800" y2="-800" x1="464" />
            <line x2="528" y1="-736" y2="-736" x1="464" />
            <line x2="528" y1="-672" y2="-672" x1="464" />
            <line x2="528" y1="-608" y2="-608" x1="464" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="LEDdriver">
            <timestamp>2015-11-2T22:2:9</timestamp>
            <rect width="304" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <block symbolname="alu_reg_mem" name="alu_reg_mem_unit">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="immEn" name="immEn" />
            <blockpin signalname="cin" name="cin" />
            <blockpin signalname="memReadEn" name="memReadEn" />
            <blockpin signalname="aluResultEn" name="aluResultEn" />
            <blockpin signalname="memEnA" name="memEnA" />
            <blockpin signalname="memWeA" name="memWeA" />
            <blockpin signalname="memEnB" name="memEnB" />
            <blockpin signalname="memWeB" name="memWeB" />
            <blockpin signalname="memOutEnA" name="memOutEnA" />
            <blockpin signalname="memOutEnB" name="memOutEnB" />
            <blockpin signalname="pcAddrEn" name="pcAddrEn" />
            <blockpin signalname="regAddrEn" name="regAddrEn" />
            <blockpin signalname="PCen" name="PCEn" />
            <blockpin signalname="branchEn" name="branchEn" />
            <blockpin signalname="jumpEn" name="jumpEn" />
            <blockpin signalname="imm(15:0)" name="imm(15:0)" />
            <blockpin signalname="bufEnA(4:0)" name="bufEnA(4:0)" />
            <blockpin signalname="bufEnB(4:0)" name="bufEnB(4:0)" />
            <blockpin signalname="aluOp(7:0)" name="aluOp(7:0)" />
            <blockpin signalname="regEn(4:0)" name="regEn(4:0)" />
            <blockpin signalname="branchOffsetImm5(9:0)" name="branchOffsetImm(9:0)" />
            <blockpin name="aluDataOut(15:0)" />
            <blockpin signalname="XLXN_27(0:15)" name="memOutA(15:0)" />
            <blockpin name="memOutB(15:0)" />
            <blockpin name="aluFlags(4:0)" />
            <blockpin name="busBDataOut(15:0)" />
            <blockpin name="PCOut(9:0)" />
        </block>
        <block symbolname="ControlUnit" name="controller">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_27(0:15)" name="instruction(15:0)" />
            <blockpin signalname="memOutEnA" name="memOutEnA" />
            <blockpin signalname="aluResultEn" name="aluResultEn" />
            <blockpin signalname="cin" name="cin" />
            <blockpin signalname="immEn" name="immEn" />
            <blockpin signalname="memReadEn" name="memReadEn" />
            <blockpin name="aluToMemEn" />
            <blockpin signalname="memOutEnB" name="memOutEnB" />
            <blockpin signalname="memEnA" name="memEnA" />
            <blockpin signalname="memEnB" name="memEnB" />
            <blockpin signalname="memWeA" name="memWeA" />
            <blockpin signalname="memWeB" name="memWeB" />
            <blockpin signalname="branchEn" name="branchEn" />
            <blockpin signalname="jumpEn" name="jumpEn" />
            <blockpin signalname="PCen" name="PCen" />
            <blockpin signalname="pcAddrEn" name="pcAddrEn" />
            <blockpin signalname="regAddrEn" name="regAddrEn" />
            <blockpin signalname="regEn(4:0)" name="regEn(4:0)" />
            <blockpin signalname="aluOp(7:0)" name="aluOp(7:0)" />
            <blockpin signalname="bufEnA(4:0)" name="bufEnA(4:0)" />
            <blockpin signalname="bufEnB(4:0)" name="bufEnB(4:0)" />
            <blockpin signalname="imm(15:0)" name="imm(15:0)" />
            <blockpin signalname="branchOffsetImm5(9:0)" name="branchOffsetImm(9:0)" />
        </block>
        <block symbolname="LEDdriver" name="XLXI_3">
            <blockpin signalname="clk" name="CLK" />
            <blockpin signalname="reset" name="Reset" />
            <blockpin signalname="XLXN_27(0:15)" name="RESULT(0:15)" />
            <blockpin signalname="segment(0:3)" name="Segment(0:3)" />
            <blockpin signalname="digit(0:7)" name="Digit(0:7)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1840" y="1840" name="alu_reg_mem_unit" orien="R0">
        </instance>
        <instance x="480" y="1744" name="controller" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="432" y1="368" y2="368" x1="272" />
            <wire x2="480" y1="368" y2="368" x1="432" />
            <wire x2="432" y1="368" y2="1824" x1="432" />
            <wire x2="1072" y1="1824" y2="1824" x1="432" />
            <wire x2="432" y1="320" y2="368" x1="432" />
            <wire x2="2448" y1="320" y2="320" x1="432" />
            <wire x2="2448" y1="320" y2="800" x1="2448" />
            <wire x2="2496" y1="800" y2="800" x1="2448" />
            <wire x2="1072" y1="400" y2="1824" x1="1072" />
            <wire x2="1840" y1="400" y2="400" x1="1072" />
        </branch>
        <branch name="reset">
            <wire x2="464" y1="1040" y2="1040" x1="304" />
            <wire x2="480" y1="1040" y2="1040" x1="464" />
            <wire x2="464" y1="1040" y2="1808" x1="464" />
            <wire x2="1056" y1="1808" y2="1808" x1="464" />
            <wire x2="464" y1="304" y2="1040" x1="464" />
            <wire x2="2432" y1="304" y2="304" x1="464" />
            <wire x2="2432" y1="304" y2="864" x1="2432" />
            <wire x2="2496" y1="864" y2="864" x1="2432" />
            <wire x2="1056" y1="464" y2="1808" x1="1056" />
            <wire x2="1840" y1="464" y2="464" x1="1056" />
        </branch>
        <branch name="memOutEnA">
            <wire x2="1424" y1="368" y2="368" x1="1008" />
            <wire x2="1424" y1="368" y2="1040" x1="1424" />
            <wire x2="1840" y1="1040" y2="1040" x1="1424" />
        </branch>
        <branch name="aluResultEn">
            <wire x2="1408" y1="432" y2="432" x1="1008" />
            <wire x2="1408" y1="432" y2="720" x1="1408" />
            <wire x2="1840" y1="720" y2="720" x1="1408" />
        </branch>
        <branch name="cin">
            <wire x2="1392" y1="496" y2="496" x1="1008" />
            <wire x2="1392" y1="496" y2="592" x1="1392" />
            <wire x2="1840" y1="592" y2="592" x1="1392" />
        </branch>
        <branch name="immEn">
            <wire x2="1376" y1="560" y2="560" x1="1008" />
            <wire x2="1376" y1="528" y2="560" x1="1376" />
            <wire x2="1840" y1="528" y2="528" x1="1376" />
        </branch>
        <branch name="memReadEn">
            <wire x2="1392" y1="624" y2="624" x1="1008" />
            <wire x2="1392" y1="624" y2="656" x1="1392" />
            <wire x2="1840" y1="656" y2="656" x1="1392" />
        </branch>
        <branch name="memOutEnB">
            <wire x2="1408" y1="752" y2="752" x1="1008" />
            <wire x2="1408" y1="752" y2="1104" x1="1408" />
            <wire x2="1840" y1="1104" y2="1104" x1="1408" />
        </branch>
        <branch name="memEnA">
            <wire x2="1392" y1="816" y2="816" x1="1008" />
            <wire x2="1392" y1="784" y2="816" x1="1392" />
            <wire x2="1840" y1="784" y2="784" x1="1392" />
        </branch>
        <branch name="memEnB">
            <wire x2="1392" y1="880" y2="880" x1="1008" />
            <wire x2="1392" y1="880" y2="912" x1="1392" />
            <wire x2="1840" y1="912" y2="912" x1="1392" />
        </branch>
        <branch name="memWeA">
            <wire x2="1376" y1="944" y2="944" x1="1008" />
            <wire x2="1376" y1="848" y2="944" x1="1376" />
            <wire x2="1840" y1="848" y2="848" x1="1376" />
        </branch>
        <branch name="memWeB">
            <wire x2="1392" y1="1008" y2="1008" x1="1008" />
            <wire x2="1392" y1="976" y2="1008" x1="1392" />
            <wire x2="1840" y1="976" y2="976" x1="1392" />
        </branch>
        <branch name="branchEn">
            <wire x2="1392" y1="1072" y2="1072" x1="1008" />
            <wire x2="1392" y1="1072" y2="1360" x1="1392" />
            <wire x2="1840" y1="1360" y2="1360" x1="1392" />
        </branch>
        <branch name="jumpEn">
            <wire x2="1376" y1="1136" y2="1136" x1="1008" />
            <wire x2="1376" y1="1136" y2="1424" x1="1376" />
            <wire x2="1840" y1="1424" y2="1424" x1="1376" />
        </branch>
        <branch name="PCen">
            <wire x2="1424" y1="1200" y2="1200" x1="1008" />
            <wire x2="1424" y1="1200" y2="1296" x1="1424" />
            <wire x2="1840" y1="1296" y2="1296" x1="1424" />
        </branch>
        <branch name="pcAddrEn">
            <wire x2="1440" y1="1264" y2="1264" x1="1008" />
            <wire x2="1440" y1="1168" y2="1264" x1="1440" />
            <wire x2="1840" y1="1168" y2="1168" x1="1440" />
        </branch>
        <branch name="regAddrEn">
            <wire x2="1408" y1="1328" y2="1328" x1="1008" />
            <wire x2="1408" y1="1232" y2="1328" x1="1408" />
            <wire x2="1840" y1="1232" y2="1232" x1="1408" />
        </branch>
        <branch name="regEn(4:0)">
            <wire x2="1360" y1="1392" y2="1392" x1="1008" />
            <wire x2="1360" y1="1392" y2="1744" x1="1360" />
            <wire x2="1840" y1="1744" y2="1744" x1="1360" />
        </branch>
        <branch name="aluOp(7:0)">
            <wire x2="1424" y1="1456" y2="1456" x1="1008" />
            <wire x2="1424" y1="1456" y2="1680" x1="1424" />
            <wire x2="1840" y1="1680" y2="1680" x1="1424" />
        </branch>
        <branch name="bufEnA(4:0)">
            <wire x2="1408" y1="1520" y2="1520" x1="1008" />
            <wire x2="1408" y1="1520" y2="1552" x1="1408" />
            <wire x2="1840" y1="1552" y2="1552" x1="1408" />
        </branch>
        <branch name="bufEnB(4:0)">
            <wire x2="1408" y1="1584" y2="1584" x1="1008" />
            <wire x2="1408" y1="1584" y2="1616" x1="1408" />
            <wire x2="1840" y1="1616" y2="1616" x1="1408" />
        </branch>
        <branch name="imm(15:0)">
            <wire x2="1392" y1="1648" y2="1648" x1="1008" />
            <wire x2="1392" y1="1488" y2="1648" x1="1392" />
            <wire x2="1840" y1="1488" y2="1488" x1="1392" />
        </branch>
        <branch name="branchOffsetImm5(9:0)">
            <wire x2="1344" y1="1712" y2="1712" x1="1008" />
            <wire x2="1344" y1="1712" y2="1808" x1="1344" />
            <wire x2="1840" y1="1808" y2="1808" x1="1344" />
        </branch>
        <instance x="2496" y="960" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_27(0:15)">
            <wire x2="400" y1="288" y2="1712" x1="400" />
            <wire x2="480" y1="1712" y2="1712" x1="400" />
            <wire x2="2464" y1="288" y2="288" x1="400" />
            <wire x2="2464" y1="288" y2="672" x1="2464" />
            <wire x2="2464" y1="672" y2="928" x1="2464" />
            <wire x2="2496" y1="928" y2="928" x1="2464" />
            <wire x2="2464" y1="672" y2="672" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="272" y="368" name="clk" orien="R180" />
        <iomarker fontsize="28" x="304" y="1040" name="reset" orien="R180" />
        <branch name="segment(0:3)">
            <wire x2="2960" y1="800" y2="800" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="800" name="segment(0:3)" orien="R0" />
        <branch name="digit(0:7)">
            <wire x2="2960" y1="928" y2="928" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="928" name="digit(0:7)" orien="R0" />
    </sheet>
</drawing>