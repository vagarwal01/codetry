class ProgressData{
  final String imageUrl;
  final int pct;
  final int tYoga;
  final int dYoga;

  ProgressData(this.imageUrl, this.pct, this.tYoga, this.dYoga);

}

final _progress1 = ProgressData('assets/monday.png',33,5,2);
final _progress2 = ProgressData('assets/tue.png',59,5,3);
final _progress3 = ProgressData('assets/wed.png',41,5,3);
final _progress4 = ProgressData('assets/thu.png',70,5,4);
final _progress5 = ProgressData('assets/fri.png',66,5,3);

final List<ProgressData> progresslt = [
  _progress1,
  _progress2,
  _progress3,
  _progress4,
  _progress5,
];
