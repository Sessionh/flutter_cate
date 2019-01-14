class NodeModel {
  int pageNumber;
  bool isThat;

  NodeModel({
    this.pageNumber,
    this.isThat,
  });
  
  NodeModel.initData({
    this.pageNumber: 0,
    this.isThat: true,
  });
}