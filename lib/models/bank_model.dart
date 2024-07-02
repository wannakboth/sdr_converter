import 'dart:convert';

/// @author linhtn

class BankInfo {
  final String code;
  final int digit;
  final String name;

  BankInfo({
    required this.code,
    required this.digit,
    required this.name,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) {
    return BankInfo(
      code: json['code'],
      digit: json['digit'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'digit': digit,
        'name': name,
      };

  String toJson() => json.encode(toMap());
}

var bankList = <BankInfo>[
  BankInfo(code: '041001', digit: 9, name: "Acleda Bank Plc"),
  BankInfo(code: '036100', digit: 6, name: "Advanced Bank Of Asia Ltd"),
  BankInfo(code: '068601', digit: 4, name: "Agribank Cambodia Branch"),
  BankInfo(code: '056301', digit: 5, name: "ALPHA Bank"),
  BankInfo(code: '103001', digit: 4, name: "Asia-Pacific Development Bank Plc"),
  BankInfo(code: '098001', digit: 1, name: "B.I.C (Cambodia) Bank PLC"),
  BankInfo(code: '082001', digit: 9, name: "Bangkok Bank Plc. Br. Cambodia"),
  BankInfo(
      code: '071001',
      digit: 2,
      name: "Bank Of China Limited Phnom Penh Branch"),
  BankInfo(code: '058201', digit: 5, name: "Booyoung Khmer Bank"),
  BankInfo(
      code: '091002',
      digit: 6,
      name: "Branch of KASIKORN Bank Public Company Ltd"),
  BankInfo(code: '092001', digit: 7, name: "Bred Bank Cambodia Plc"),
  BankInfo(code: '056306', digit: 4, name: "Bridge Bank"),
  BankInfo(code: '016010', digit: 1, name: "Cambodia Asia Bank Ltd"),
  BankInfo(code: '079001', digit: 4, name: "Cambodia Post Bank Plc"),
  BankInfo(code: '003001', digit: 5, name: "Cambodian Commercial Bank Ltd"),
  BankInfo(code: '004010', digit: 5, name: "Cambodian Public Bank Ltd"),
  BankInfo(code: '005001', digit: 3, name: "Canadia Bank Plc"),
  BankInfo(
      code: '080011', digit: 0, name: "Cathay United Bank Cambodia Co, Ltd"),
  BankInfo(code: '116100', digit: 9, name: "CCU Commercial Bank Plc"),
  BankInfo(
      code: '095210', digit: 1, name: "Chief (Cambodia) Commercial Bank Plc"),
  BankInfo(code: '099001', digit: 0, name: "Chip Mong Commercial Bank Plc."),
  BankInfo(code: '072121', digit: 7, name: "CIMB Bank Cambodia Plc"),
  BankInfo(code: '106001', digit: 1, name: "DGB Bank Plc"),
  BankInfo(code: '040001', digit: 0, name: "First Commercial Bank"),
  BankInfo(code: '001010', digit: 8, name: "Foreign Trade Bank Of Cambodia"),
  BankInfo(code: '085001', digit: 6, name: "Hattha Bank Plc"),
  BankInfo(code: '041913', digit: 5, name: "Heng Feng (Cambodia) Bank Plc"),
  BankInfo(
      code: '113001', digit: 2, name: "Heng He (Cambodia) Commercial Bank Plc"),
  BankInfo(code: '077001', digit: 6, name: "Hong Leong Bank Cambodia"),
  BankInfo(code: '069001', digit: 6, name: "ICBC Limited Phnom Penh"),
  BankInfo(code: '041902', digit: 8, name: "Industrial Bank Of Korea"),
  BankInfo(code: '102010', digit: 6, name: "JTrust Royal Bank Ltd"),
  //066001 9 Kookmin Bank Cambodia Plc
  BankInfo(code: '088001', digit: 3, name: "KB PRASAC BANK PLC"),
  BankInfo(code: '009999', digit: 4, name: "Krung Thai Bank Public Co, Ltd"),
  BankInfo(code: '020001', digit: 4, name: "May Bank Phnom Penh Branch Plc"),
  BankInfo(code: '074001', digit: 9, name: "MB Bank Plc Phnom Penh Branch"),
  BankInfo(
      code: '073001', digit: 0, name: "Mega International Commercial Bank"),
  BankInfo(code: '056304', digit: 9, name: "MOHANOKOR MFI"),
  BankInfo(code: '100001', digit: 7, name: "National Bank Of Cambodia"),
  BankInfo(code: '110100', digit: 5, name: "Oriental Bank"),
  BankInfo(code: '058202', digit: 3, name: "Panda Commercila Bank Plc"),
  BankInfo(code: '081005', digit: 1, name: "Phillip Bank Plc"),
  BankInfo(code: '058111', digit: 6, name: "Phnom Penh Commercial Bank"),
  BankInfo(code: '096001', digit: 3, name: "Prince Bank Plc"),
  BankInfo(code: '078002', digit: 3, name: "RHB Indochina Bank Limited"),
  BankInfo(code: '058203', digit: 1, name: "Rui Li (Cambodia) Bank Plc"),
  BankInfo(code: '005300', digit: 9, name: "Rural Development Bank"),
  BankInfo(code: '064001', digit: 1, name: "Sacom Bank Cambodia Plc"),
  BankInfo(code: '056099', digit: 5, name: "Sathapana Bank Plc"),
  BankInfo(code: '105999', digit: 7, name: "SBI Ly Hour Bank"),
  BankInfo(
      code: '041905', digit: 1, name: "SHB Plc Phnom Penh Branch Cambodia"),
  BankInfo(code: '053001', digit: 4, name: "Shinhan Bank (Cambodia) Plc"),
  BankInfo(
      code: '041910',
      digit: 1,
      name: "Small and Medium Enterprise Bank Of Cambodia Plc"),
  BankInfo(
      code: '076001',
      digit: 7,
      name: "Taiwan Cooperative Bank Phnom Penh Branch"),
  BankInfo(code: '026100', digit: 8, name: "Union Commercial Bank Plc"),
  BankInfo(code: '043050', digit: 4, name: "Vattanac Bank"),
  BankInfo(code: '109001', digit: 8, name: "Wing Bank (Cambodia) Plc"),
  BankInfo(code: '056305', digit: 6, name: "Woori Bank"),
];
