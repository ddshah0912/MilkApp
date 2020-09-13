class Order{
  String id;
  String custId,itemId;
  int amount;
  int noOfItems;
  DateTime sdate,edate; 
  Order({this.id,this.custId, this.itemId,this.noOfItems,this.amount,this.sdate,this.edate});
}