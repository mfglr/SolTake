String compressText(String text,int count) =>
  text.length <= count ? text : "${text.substring(0,count - 3)}..."; 