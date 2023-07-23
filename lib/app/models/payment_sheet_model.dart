class PaymentSheetModel {
  String? id;
  String? rentName;
  String? months;
  String? amount;
  String? advanceAmount;
  String? status;
  String? date;
  String? bloc;

  PaymentSheetModel(
      {this.id,
        this.rentName,
        this.months,
        this.amount,
        this.advanceAmount,
        this.status,
        this.date,
        this.bloc});

  PaymentSheetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rentName = json['rentName'];
    months = json['months'];
    amount = json['amount'];
    advanceAmount = json['advanceAmount'];
    status = json['status'];
    date = json['date'];
    bloc = json['bloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rentName'] = this.rentName;
    data['months'] = this.months;
    data['amount'] = this.amount;
    data['advanceAmount'] = this.advanceAmount;
    data['status'] = this.status;
    data['date'] = this.date;
    data['bloc'] = this.bloc;
    return data;
  }
}