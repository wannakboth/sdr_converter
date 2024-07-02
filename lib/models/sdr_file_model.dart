import 'package:xml/xml.dart';

/// @author linhtn

class SDRFile {
  final List<Payment> payments;

  SDRFile({required this.payments});

  XmlElement toXml() {
    return XmlElement(XmlName('SDRFile'), [],
        [for (var paymentItem in payments) paymentItem.toXml()]);
  }
}

class Payment {
  final String paymentTypeCode;
  final String serialNo;
  final String paymentDate;
  final String payerBank;
  final String payerCheckDigit;
  final String payerAccountNo;
  final String amount;
  final String currencyCode;
  final String securityCode;
  final String payerName;
  final String payeeBank;
  final String payeeCheckDigit;
  final String payeeAccountNo;
  final String payeeName;
  final String payeeRef;
  final String returnCode;
  final String inputDate;
  final String processingDate;
  final String inputBatchNo;
  final String outputBatchNo;

  Payment({
    required this.paymentTypeCode,
    required this.serialNo,
    required this.paymentDate,
    required this.payerBank,
    required this.payerCheckDigit,
    required this.payerAccountNo,
    required this.amount,
    required this.currencyCode,
    required this.securityCode,
    required this.payerName,
    required this.payeeBank,
    required this.payeeCheckDigit,
    required this.payeeAccountNo,
    required this.payeeName,
    required this.payeeRef,
    required this.returnCode,
    required this.inputDate,
    required this.processingDate,
    required this.inputBatchNo,
    required this.outputBatchNo,
  });

  XmlElement toXml() {
    return XmlElement(XmlName('Payment'), [], [
      XmlElement(XmlName('PaymentTypeCode'), [], [XmlText(paymentTypeCode)]),
      XmlElement(XmlName('SerialNo'), [], [XmlText(serialNo)]),
      XmlElement(XmlName('PaymentDate'), [], [XmlText(paymentDate)]),
      XmlElement(XmlName('PayerBank'), [], [XmlText(payerBank)]),
      XmlElement(XmlName('PayerCheckDigit'), [], [XmlText(payerCheckDigit)]),
      XmlElement(XmlName('PayerAccountNo'), [], [XmlText(payerAccountNo)]),
      XmlElement(XmlName('Amount'), [], [XmlText(amount)]),
      XmlElement(XmlName('CurrencyCode'), [], [XmlText(currencyCode)]),
      XmlElement(XmlName('SecurityCode'), [], [XmlText(securityCode)]),
      XmlElement(XmlName('PayerName'), [], [XmlText(payerName)]),
      XmlElement(XmlName('PayeeBank'), [], [XmlText(payeeBank)]),
      XmlElement(XmlName('PayeeCheckDigit'), [], [XmlText(payeeCheckDigit)]),
      XmlElement(XmlName('PayeeAccountNo'), [], [XmlText(payeeAccountNo)]),
      XmlElement(XmlName('PayeeName'), [], [XmlText(payeeName)]),
      XmlElement(XmlName('PayeeRef'), [], [XmlText(payeeRef)]),
      XmlElement(XmlName('ReturnCode'), [], [XmlText(returnCode)]),
      XmlElement(XmlName('InputDate'), [], [XmlText(inputDate)]),
      XmlElement(XmlName('ProcessingDate'), [], [XmlText(processingDate)]),
      XmlElement(XmlName('InputBatchNo'), [], [XmlText(inputBatchNo)]),
      XmlElement(XmlName('OutputBatchNo'), [], [XmlText(outputBatchNo)]),
    ]);
  }
}
