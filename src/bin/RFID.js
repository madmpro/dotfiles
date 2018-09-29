#!/usr/bin/env node
// Convert RFID Text code to DEC and HEX

function codeHex2Dec( instr ) {
//    codeHex = instr.substring(4,6) + instr.substring(2,4) + instr.substring(0,2);
    var codeHex = instr.toUpperCase();
    var codeInt = parseInt(codeHex,16);
    var codeDec = ("0000000000" + codeInt).slice(-10);
    return codeDec;
}

function codeDec2Hex( instr ) {
    var codeInt = parseInt(instr,10);
    var codeHex = codeInt.toString(16);
    var codeHex = ("000000" + codeHex).slice(-6);
//    codeHex = codeHex.substring(4,6) + codeHex.substring(2,4) + codeHex.substring(0,2);
    return codeHex.toUpperCase();
}

function codeTxt2Hex( instr ) {
    var l = instr.length;
    var p = instr.indexOf("/");
    var codeP1 = instr.substring(0, p);
    var codeP2 = instr.substring(p+1);
    var codeP1I = parseInt(codeP1,10);
    var codeP2I = parseInt(codeP2,10);
    var codeP1H = codeP1I.toString(16);
    var codeP2H = codeP2I.toString(16);

//    var p2 = new Array( 5 - codeP2H.length ).join( "0" );
    var codeHex = codeP1H + ("0000"+codeP2H).slice(-4);
    codeHex = ("000000"+codeHex).slice(-6);
//    codeHex = codeHex.substring(4,6) + codeHex.substring(2,4) + codeHex.substring(0,2);
    return codeHex.toUpperCase();
}

function codeHex2Txt( instr ) {
//    var codeHex = instr.substring(4,6) + instr.substring(2,4) + instr.substring(0,2);
    var codeHex = instr.toUpperCase();
    var l = codeHex.length;
    var codeP1 = codeHex.substring(0,l-4);
    var codeP2 = codeHex.substring(l-4);
    var codeP1I = parseInt(codeP1,16);
    var codeP2I = parseInt(codeP2,16);

    var codeText = ("000" + codeP1I).slice(-3) + '/' + ("00000" + codeP2I).slice(-5);
    return codeText;
}

function convertItDEC(codeDec) {

  codeDec = codeDec.replace(/\s+/g, '');
  console.log(`Dec: ${codeDec}`);

  var codeHex = codeDec2Hex(codeDec);
  console.log(`Hex: ${codeHex}`);

  var codeTxt = codeHex2Txt(codeHex);
  console.log(`Text: ${codeTxt}`);
}

function convertItHEX(codeHex) {

  codeHex = codeHex.replace(/\s+/g, '');
  console.log(`Hex: ${codeHex}`);

  var codeDec = codeHex2Dec(codeHex);
  console.log(`Dec: ${codeDec}`);

  var codeTxt = codeHex2Txt(codeHex);
  console.log(`Text: ${codeTxt}`);

}

function convertItTXT(codeTxt) {

  codeTxt = codeTxt.replace(/\s+/g, '');
  console.log(`Text: ${codeTxt}`);

  var codeHex = codeTxt2Hex(codeTxt);
  console.log(`Hex: ${codeHex}`);

  var codeDec = codeHex2Dec(codeHex);
  console.log(`Dec: ${codeDec}`);

}

var Args = process.argv.slice(2);
var CType = Args[0];

if (CType == "-t") { convertItTXT(`${Args[1]}`); }
else if (CType == "-d")  { convertItDEC(`${Args[1]}`); }
else if (CType == "-h")  { convertItHEX(`${Args[1]}`); }
else { console.log(`Usage: RFID.js -{t,d,h} CodeNumber`);}
