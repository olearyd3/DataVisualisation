//initialise globals
import processing.pdf.*;

Table table;
int contID;
float pixels;

void setup() {
  size(1025, 800, PDF, "Assignment3_1C.pdf");
  table = loadTable("gapminder.csv", "header");
} 
  
void draw() {
  background(240);
  // draw the axes
  axes();
  axisLabels();
  graphTitle();
  data();
  
  fill(0);
  PFont keyFont = createFont("Arial", 14);
  textFont(keyFont);
  stroke(200);
  fill(200);
  circle(910, 320, 7);
  stroke(175);
  fill(175);
  circle(910, 360, 7);
  stroke(150);
  fill(150);
  circle(910, 400, 7);
  stroke(100);
  fill(100);
  circle(910, 440, 7);
  stroke(50);
  fill(50);
  circle(910, 480, 7);
  fill(0);
  text("Asia", 925, 325);
  text("Africa", 925, 365);
  text("Europe", 925, 405);
  text("Americas", 925, 445);
  text("Oceania", 925, 485);
  
  PFont yAxisFont = createFont("Arial", 20);
  textFont(yAxisFont);
  
  float x = 30;
  float y = 150;
  textAlign(CENTER,BOTTOM);

  pushMatrix();
  translate(x,y);
  rotate(-HALF_PI);
  text("Life Expectancy", -250, 30);
  popMatrix();
  exit();
}

void axes() {
  // draw the axes
  fill(0);
  stroke(200);
  line(105, 700, 885, 700);
  line(105, 700, 105, 100);
  // draw the vertical lines
  for(int i = 0; i < 13; i++) {
    if(i != 0) {
      line(105+i*65, 699, 105+i*65, 100);
    }
    if(i < 12) {
      text(1952+i*5, 125+i*65, 715);
    }
  }
  // draw the horizontal lines
  for(int i = 0; i < 11; i++) {
    line(106, 700-i*60, 885, 700-i*60);
    if(i != 0 && 10*i != 100) {
      text(10*i, 80, 705-i*60);
    }
    else if(10*i == 100) {
      text("100", 75, 705-i*60);
    }
    else {
      text("0", 87, 705-i*60);
    }
  }
}

void axisLabels() {
  PFont axisTitleFont = createFont("Arial", 20);
  textFont(axisTitleFont);
  text("Years", 470, 750);
}

void colourChooser(String cont) {
  if(cont.equals("Asia")) {
    fill(200);
    stroke(200);
    contID = 1;
    
  }
  else if(cont.equals("Africa")) {
    fill(175);
    stroke(175);
    contID = 2;
  }
  else if(cont.equals("Europe")) {
    fill(155);
    stroke(150);
    contID = 3;
    
  }
  else if(cont.equals("Americas")) {
    fill(100);
    stroke(100);
    contID = 4;
  }
  else {
    fill(50);
    stroke(50);
    contID = 5;
  }
}

void data() {
  for(TableRow row: table.rows()) {
    float lifeExp = row.getFloat("lifeExp");
    int year = row.getInt("year");
    String continent = row.getString("continent");
    colourChooser(continent);
    spaceData(year, lifeExp);
    //circle((year-1900)*contID, 500-4*lifeExp, 5);
  }
}

float lifeExToPixels(float lifeExpec) {
    pixels = (700-((lifeExpec/10)*60));
    return pixels;
}

void spaceData(int yr, float lifeEx) {
  if(yr == 1952) {
      circle(110+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1957) {
      circle(175+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1962) {
      circle(240+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1967) {
      circle(305+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1972) {
      circle(370+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1977) {
      circle(435+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1982) {
      circle(500+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1987) {
      circle(565+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1992) {
      circle(630+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 1997) {
      circle(695+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else if(yr == 2002) {
      circle(760+10*contID, lifeExToPixels(lifeEx), 5);
    }
  else {
      circle(825+10*contID, lifeExToPixels(lifeEx), 5);
    }
}

void graphTitle() {
  font();
  text("Graph of Life Expectancy from 1952-2007 across the Continents", 87, 70);
}

void font() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont graphTitleFont = createFont("Arial", 30);
  PFont.list();
  textFont(graphTitleFont);
}
