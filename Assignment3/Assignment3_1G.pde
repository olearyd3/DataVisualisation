//initialise globals
import processing.pdf.*;
import processing.svg.*;

Table table;
int contID;
float pixels;

// GDP - x-axis
// life expectancy - y-axis
// year - colour - 12 needed: black, red, orange, yellow, light green, dark green, teal, light blue, dark blue, purple, pink, grey
// population - size
// country - label
// continent - mark
void setup() {
  size(1025, 800, SVG, "Assignment3_1G.svg");
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
  
  PFont keyFont = createFont("Arial", 12);
  textFont(keyFont);
  stroke(0);
    for(int i = 0; i < 11; i++) {  
    if(i != 0 && 10*i != 100) {
      text(10*i, 73, 705-i*60);
    }
    else if(10*i == 100) {
      text("100", 68, 705-i*60);
    }
    else {
      text("0", 80, 705-i*60);
    }
  }
  //making the key - colours of each year
    PFont legendFont = createFont("Arial", 14);
    textFont(legendFont);
  //textFont(legendFont);
  //1952
    fill(0);
    stroke(0);
    text("*The larger the mark, the bigger the population", 590, 115);
    circle(910, 176, 8);
    fill(0);
    text("1952", 925, 180);
  //1957
    fill(255, 0, 0);
    stroke(255, 0, 0);
    circle(910, 216, 8);
    fill(0);
    text("1957", 925, 220);
  //1962
    fill(255, 165, 0);
    stroke(255, 165, 0);
    circle(910, 256, 8);
    fill(0);
    text("1962", 925, 260);
  //1967
    fill(255, 255, 0);
    stroke(255, 255, 0);
    circle(910, 296, 8);
    fill(0);
    text("1967", 925, 300);
  //1972
    fill(0, 128, 0);
    stroke(0, 128, 0);
    circle(910, 336, 8);
    fill(0);
    text("1972", 925, 340);
  //1977
    fill(0, 255, 0);
    stroke(0, 255, 0);
    circle(910, 376, 8);
    fill(0);
    text("1977", 925, 380);
  //1982
    fill(0, 128, 128);
    stroke(0, 128, 128);
    circle(910, 416, 8);
    fill(0);
    text("1982", 925, 420);
  //1987
    fill(0, 0, 128);
    stroke(0, 0, 128);
    circle(910, 456, 8);
    fill(0);
    text("1987", 925, 460);
  //1992
    fill(0, 0, 255);
    stroke(0, 0, 255);
    circle(910, 496, 8);
    fill(0);
    text("1992", 925, 500);
  //1997
    fill(200, 30, 200);
    stroke(200, 30, 200);
    circle(910, 536, 8);
    fill(0);
    text("1997", 925, 540);
  //2002
    fill(255, 182, 193);
    stroke(255, 182, 193);
    circle(910, 576, 8);
    fill(0);
    text("2002", 925, 580);
  //2007
    fill(160);
    stroke(160);
    circle(910, 616, 8);
    fill(0);
    text("2007", 925, 620);
  PFont legendTitleFont = createFont("Arial", 16);
  textFont(legendTitleFont);
  text("Continents Key", 766, 544);
  fill(0);
  stroke(0);
  line(105, 700, 105, 100);
  line(105, 700, 885, 700);
  // key for the mark data
  line(760, 525, 760, 695);
  line(880, 525, 880, 695);
  line(760, 525, 880, 525);
  line(760, 695, 880, 695);
  line(760, 550, 880, 550);
  text("O", 765, 570);
  text("X", 765, 600);
  circle(771, 624, 12);
  // HASHTAG TO BE REPLACED BY MORE SUITABLE SHAPE
  text("#", 766, 658);
  rect(765, 675, 11, 11);
  text("Europe", 785, 570);
  text("Africa", 785, 600);
  text("Asia", 785, 630);
  text("Americas", 785, 658);
  text("Oceania", 785, 686);
  PFont footnoteFont = createFont("Arial", 8);
  textFont(footnoteFont);
  text("*Please note that for the purpose of being able to see the data more clearly, Kuwait's figures from 1952-1972 has been omitted due to being significantly greater than the rest, but these figures can be found at https://cran.r-project.org/web/packages/gapminder/index.html", 35, 795);
  textFont(legendTitleFont);
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

//void countryLabels() {
//  fill(0);
//  stroke(0);
//  PFont countryFont = createFont("Arial", 9);
//  textFont(countryFont);
//}

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
      text((i+1)*5000, 150+i*65, 715);
    }
  }
  // draw the horizontal lines
  for(int i = 0; i < 11; i++) {
    line(106, 700-i*60, 885, 700-i*60);
    if(i != 0 && 10*i != 100) {
      text(10*i, 73, 705-i*60);
    }
    else if(10*i == 100) {
      text("100", 68, 705-i*60);
    }
    else {
      text("0", 80, 705-i*60);
    }
  }
}

void axisLabels() {
  PFont axisTitleFont = createFont("Arial", 20);
  textFont(axisTitleFont);
  text("GDP per capita", 430, 750);
}

void data() {
  for(TableRow row: table.rows()) {
    float lifeExp = row.getFloat("lifeExp");
    float gdp = row.getFloat("gdpPercap");
    int population = row.getInt("pop");
    int year = row.getInt("year");
    String continent = row.getString("continent");
    String country = row.getString("country");
    if(continent.equals("Asia")) {   
      contID = 1;  
    }
    else if(continent.equals("Africa")) {
      contID = 2;
    }
    else if(continent.equals("Europe")) {
      contID = 3;     
    }
    else if(continent.equals("Americas")) {
      contID = 4;
    }
    else {
      contID = 5;
    }
    spaceData(gdp, lifeExp, population, year, country);
    fill(240);
    stroke(240);
    // eliminate parts of circles outside graph
    rect(50, 90, 54, 650);
  }
}

float lifeExToPixels(float lifeExpec) {
    pixels = (700-((lifeExpec/10)*60));
    return pixels;
}

//can take out Kuwait but MUST include it as a footnote if done

void spaceData(float gdpercap, float lifeEx, int popul, int yearID, String countryID) {
    yearColours(yearID);
    // Asia - WORKS CORRECTLY DO NOT CHANGE
    if(contID == 1) {
      if(popul/10000000 < 1.5) {   
        circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), 1.5);
        //countryLabels();
        //text(countryID, 108 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
      }
      else {
        circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), popul/10000000);
        //countryLabels();
        //text(countryID, 108 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
      }
    }
    // Africa - WORKS CORRECTLY DO NOT CHANGE
    else if(contID == 2) {
      if(popul/10000000 < 1.5) {   
        PFont starFontOne = createFont("Arial", 5);
        textFont(starFontOne);
        text("X", 102 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
      else {
        PFont starFontTwo = createFont("Arial", 5 + popul/10000000);
        textFont(starFontTwo);
        text("X", 102 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
    }
    // Europe - WORKS CORRECTLY DO NOT CHANGE
    else if(contID == 3) {
      if(popul/10000000 < 1.5) {   
        PFont starFontOne = createFont("Arial", 5);
        textFont(starFontOne);
        text("O", 102 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
      else {
        PFont starFontTwo = createFont("Arial", 5 + popul/10000000);
        textFont(starFontTwo);
        text("O", 102 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
    }
    // Americas -- NE CHANGE PAS
    else if(contID == 4) {
      if(popul/10000000 < 1.5) {   
        PFont starFontOne = createFont("Arial", 5);
        textFont(starFontOne);
        text("#", 102 + gdpercap/76.92, lifeExToPixels(lifeEx)+3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
      else {
        PFont starFontTwo = createFont("Arial", 5 + popul/10000000);
        textFont(starFontTwo);
        text("#", 102 + gdpercap/76.92, lifeExToPixels(lifeEx) +3);
        //countryLabels();
        //text(countryID, 105 + gdpercap/76.92, lifeExToPixels(lifeEx)+6);
      }
    }
    // Oceania - ne change pas
    else {
      if(popul/10000000 < 1.5) {   
        rect(103.5 + gdpercap/76.92, lifeExToPixels(lifeEx)-1.5, 3, 3);
        //countryLabels();
        //text(countryID, 106.5 + gdpercap/76.92, lifeExToPixels(lifeEx)+1.5);
      }
      else {
        rect(105 + gdpercap/76.92 - popul/10000000, lifeExToPixels(lifeEx) - popul/10000000, 2*popul/10000000, 2*popul/10000000);
        //countryLabels();
        //text(countryID, 106.5 + gdpercap/76.92, lifeExToPixels(lifeEx)+1.5);
      }
    }
}

void graphTitle() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont titleFont = createFont("Arial", 24);
  textFont(titleFont);
  text("Graph of GDP per capita vs Life Expectancy for different countries from 1952-2007", 87, 70);
}

void yearColours(int yr) {
  if(yr == 1952) {
      fill(0);
      stroke(0);
    }
  else if(yr == 1957) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
    }
  else if(yr == 1962) {
      fill(255, 165, 0);
      stroke(255, 165, 0);
    }
  else if(yr == 1967) {
      fill(255, 255, 0);
      stroke(255, 255, 0);
    }
  else if(yr == 1972) {
      fill(0, 128, 0);
      stroke(0, 128, 0);
    }
  else if(yr == 1977) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
    }
  else if(yr == 1982) {
      fill(0, 128, 128);
      stroke(0, 128, 128);
    }
  else if(yr == 1987) {
      fill(0, 0, 128);
      stroke(0, 0, 128);
    }
  else if(yr == 1992) {
      fill(0, 0, 255);
      stroke(0, 0, 255);
    }
  else if(yr == 1997) {
      fill(200, 30, 200);
      stroke(200, 30, 200);
    }
  else if(yr == 2002) {
      fill(255,182,193);
      stroke(255,182,193);
    }
  else {
      fill(160);
      stroke(160);
    }
}

void font() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont graphTitleFont = createFont("Arial", 30);
  PFont.list();
  textFont(graphTitleFont);
}
