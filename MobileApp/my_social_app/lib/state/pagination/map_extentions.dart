extension MapExtentions<T extends dynamic> on Map<int,T>{
  
  Map<int,T> prependOne(T entity) =>
    { for (var e in [entity,...values]) e.id : e };
  
  Map<int,T> appendOne(T entity) =>
    { for (var e in [...values,entity]) e.id : e };

  Map<int,T> addInOrder(T entity) =>
    {
      for (
        var e in [
          ...values.takeWhile((e) => e.id > entity.id),
          entity,
          ...values.skipWhile((e) => e.id > entity.id)
        ]
      ) e.id : e 
    };
  
  Map<int,T> where(bool Function(T) test) =>
    { for (var e in [...values.where(test)]) e.id : e };


  Map<int,T> updateOne(T entity){
    if(this[entity.id] == null) return this;
    Map<int,T> r = {};
    r.addAll(this);
    r[entity.id] = entity;
    return r;
  }
  Map<int,T> removeOne(int id){
    Map<int,T> r = {};
    r.addEntries(values.where((e) => e.id != id).map((e) => MapEntry(e.id, e)));
    return r;
  }


  Map<int,T> prependMany(Iterable<T> entities){
    Map<int,T> r = {};
    r.addEntries(entities.map((e) => MapEntry(e.id, e)));
    r.addAll(this);
    return r;
  }
  Map<int,T> appendMany(Iterable<T> entities){
    Map<int,T> r = {};
    r.addAll(this);
    r.addEntries(entities.map((e) => MapEntry(e.id, e)));
    return r;
  }
  Map<int,T> updateMany(Iterable entities){
    Map<int,T> r = {};
    r.addAll(this);
    for(var entity in entities){
      if(this[entity.id] != null){
        r[entity.id] = entity;
      }
    }
    return r;
  }
  Map<int,T> removeMany(Iterable<int> ids){
    Map<int,T> r = {};
    r.addEntries(values.where((e) => !ids.any((x) => x == e.id)).map((e) => MapEntry(e.id, e)));
    return r;
  }
}