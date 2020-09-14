class Order{
  String id;
  String custId,itemId;
  DateTime sdate,edate;
  final int amount,noOfItem; 
  Order({this.id,this.custId,this.sdate, this.edate,this.noOfItem,this.amount,this.itemId});
}