class GetTeamsModel {
  GetTeamsModel({
     this.status,
     this.message,
     this.result,
  });
   String? status;
   String? message;
   List<TeamResult>? result;
  
  GetTeamsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    result = List.from(json['result']).map((e)=>TeamResult.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['result'] = result!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TeamResult {
  TeamResult({
     this.id,
     this.name,
     this.area,
     this.leader1,
     this.leader2,
     this.member,
     this.createdAt,
     this.updatedAt,
     this.V,
  });
    String? id;
    String? name;
    String? area;
    Null? leader1;
    Null? leader2;
    List<dynamic>? member;
    String? createdAt;
    String? updatedAt;
    int? V;
  
  TeamResult.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    area = json['area'];
    leader1 = null;
    leader2 = null;
    member = List.castFrom<dynamic, dynamic>(json['member']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['area'] = area;
    _data['leader1'] = leader1;
    _data['leader2'] = leader2;
    _data['member'] = member;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}