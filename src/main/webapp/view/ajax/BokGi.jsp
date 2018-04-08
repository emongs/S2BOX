<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="float:left" align="center" >
<input class="rowInput" type=text readonly value="A"><br>
<input class="rowInput" type=text readonly value="B"><br>
<input class="rowInput" type=text readonly value="C"><br>
<input class="rowInput" type=text readonly value="D"><br>
<input class="rowInput" type=text readonly value="E"><br>
<input class="rowInput" type=text readonly value="F"><br>
<br>
<input class="rowInput" type=text readonly value="G"><br>
<input class="rowInput" type=text readonly value="H"><br>
<input class="rowInput" type=text readonly value="I"><br>
<input class="rowInput" type=text readonly value="J"><br>
</div>
<div>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A1" id="A1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A2" id="A2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A3" id="A3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A4" id="A4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A5" id="A5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A6" id="A6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A7" id="A7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A8" id="A8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A9" id="A9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A10" id="A10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A11" id="A11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A12" id="A12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A13" id="A13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A14" id="A14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A15" id="A15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="A16" id="A16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B1" id="B1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B2" id="B2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B3" id="B3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B4" id="B4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B5" id="B5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B6" id="B6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B7" id="B7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B8" id="B8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B9" id="B9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B10" id="B10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B11" id="B11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B12" id="B12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B13" id="B13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B14" id="B14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B15" id="B15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="B16" id="B16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C1" id="C1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C2" id="C2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C3" id="C3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C4" id="C4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C5" id="C5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C6" id="C6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C7" id="C7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C8" id="C8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C9" id="C9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C10" id="C10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C11" id="C11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C12" id="C12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C13" id="C13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C14" id="C14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C15" id="C15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="C16" id="C16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D1" id="D1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D2" id="D2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D3" id="D3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D4" id="D4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D5" id="D5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D6" id="D6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D7" id="D7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D8" id="D8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D9" id="D9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D10" id="D10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D11" id="D11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D12" id="D12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D13" id="D13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D14" id="D14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D15" id="D15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="D16" id="D16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E1" id="E1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E2" id="E2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E3" id="E3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E4" id="E4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E5" id="E5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E6" id="E6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E7" id="E7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E8" id="E8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E9" id="E9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E10" id="E10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E11" id="E11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E12" id="E12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E13" id="E13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E14" id="E14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E15" id="E15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="E16" id="E16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F1" id="F1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F2" id="F2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F3" id="F3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F4" id="F4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F5" id="F5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F6" id="F6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F7" id="F7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F8" id="F8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F9" id="F9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F10" id="F10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F11" id="F11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F12" id="F12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F13" id="F13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F14" id="F14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F15" id="F15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="F16" id="F16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<span>&nbsp;&nbsp;</span>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H1" id="H1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H2" id="H2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H3" id="H3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H4" id="H4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H5" id="H5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H6" id="H6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H7" id="H7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H8" id="H8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H9" id="H9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H10" id="H10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H11" id="H11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H12" id="H12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H13" id="H13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H14" id="H14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H15" id="H15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="H16" id="H16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I1" id="I1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I2" id="I2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I3" id="I3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I4" id="I4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I5" id="I5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I6" id="I6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I7" id="I7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I8" id="I8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I9" id="I9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I10" id="I10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I11" id="I11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I12" id="I12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I13" id="I13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I14" id="I14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I15" id="I15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="I16" id="I16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J1" id="J1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J2" id="J2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J3" id="J3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J4" id="J4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J5" id="J5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J6" id="J6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J7" id="J7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J8" id="J8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J9" id="J9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J10" id="J10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J11" id="J11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J12" id="J12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J13" id="J13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J14" id="J14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J15" id="J15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="J16" id="J16">16</button>
<br>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K1" id="K1">1</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K2" id="K2">2</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K3" id="K3">3</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K4" id="K4">4</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K5" id="K5">5</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K6" id="K6">6</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K7" id="K7">7</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K8" id="K8">8</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K9" id="K9">9</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K10" id="K10">10</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K11" id="K11">11</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K12" id="K12">12</button>
<span>&nbsp;&nbsp;</span>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K13" id="K13">13</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K14" id="K14">14</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K15" id="K15">15</button>
<button class="sheetButton" onclick="selectSheet(this.value,this)" value="K16" id="K16">16</button>
</div>
<input type="hidden" id="reserved" value="${reserved}">
<script>
$(document).ready(function() {
	settingButton();
});
</script>
<script>
	function settingButton(){
		var reserved=document.getElementById('reserved').value+"";
		var res=reserved.split(",");
		for (var i in res) {  
			var tmp=res[i]+"";
			document.getElementById(tmp).background ='gray';
			document.getElementById(tmp).disabled = true;
			
		}
	}
	</script>
