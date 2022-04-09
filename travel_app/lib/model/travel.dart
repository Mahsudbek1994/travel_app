class Travel{
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);
  static  List<Travel> generateTravelApp(){
    return[
      Travel('Andijan','Andijan','assets/devonaboy.jpg'),
      Travel('Buxoro','Buxoro','assets/buxoro.jpg'),
      Travel('Samarqand','Samarqand','assets/buxoro1.jpg'),
      Travel('Xiva','Xiva','assets/xiva.jpg'),
      Travel('Amirsoy','Amirsoy','assets/amirsoy.jpg'),
      Travel('Qo\'qon','Qo\'qon','assets/xiva1.jpg')
    ];
  }
  static  List<Travel> generateMostPopular(){
    return[
      Travel('Sirdaryo','Sirdaryo','assets/sirdaryo.jpg'),
      Travel('Toshkent','Toshkent','assets/toshkent.jpg'),
      Travel('Chorvoq','Chorvoq','assets/chorvoq.jpg'),
      Travel('Amirsoy','Amirsoy','assets/amirsoy.jpg'),
      Travel('Xorazm','Xorazm','assets/madrasa.jpg'),
      Travel('Buxoro','Buxoro','assets/buxoro1.jpg'),
      Travel('Samarqand','Samarqand','assets/buxoro.jpg')

    ];
  }

}