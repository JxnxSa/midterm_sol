void main(){
  //nested list, 2-dimensional list
  var myList = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
  ];
  var myList3 = [
    for(var sublist in myList)
      for(var j in sublist)
        if(j % 2 == 0)
          j,
    for(var sublist in myList)
      for(var j in sublist)
        if(j % 2 != 0)
          j,
  ];
  print(myList);
  print(myList.length);
  print(myList3);
  print(myList3.length);
}