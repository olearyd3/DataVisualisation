//initialise globals
import processing.pdf.*;

Table table;
int popID;
float pixels;

void setup() {
  size(1025, 800, PDF, "Assignment3_1F.pdf");
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
  PFont legendFont = createFont("Arial", 18);
  textFont(legendFont);
  text("Population", 915, 250);
  
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
  fill(0);
  PFont key2Font = createFont("Arial", 14);
  textFont(key2Font);
  stroke(0);
  fill(0);
  circle(910, 280, 7);
  stroke(40);
  fill(40);
  circle(910, 320, 7);
  stroke(80);
  fill(80);
  circle(910, 360, 7);
  stroke(120);
  fill(120);
  circle(910, 400, 7);
  stroke(160);
  fill(160);
  circle(910, 440, 7);
  stroke(190);
  fill(190);
  circle(910, 480, 7);
  stroke(220);
  fill(220);
  circle(910, 520, 7);
  fill(0);
  text("100 million +", 925, 285);
  text("50 million +", 925, 325);
  text("25 million +", 925, 365);
  text("10 million +", 925, 405);
  text("5 million +", 925, 445);
  text("1 million +", 925, 485);
  text("< 1 million", 925, 525);
  
  PFont yAxisFont = createFont("Arial", 20);
  textFont(yAxisFont);
  fill(0);
  stroke(0);
  line(105, 700, 105, 100);
  line(105, 700, 885, 700);
  PFont footnoteFont = createFont("Arial", 8);
  textFont(footnoteFont);
  text("*Please note that for the purpose of being able to see the data more clearly, Kuwait's figures from 1952-1972 has been omitted due to being significantly greater than the rest, but these figures can be found at https://cran.r-project.org/web/packages/gapminder/index.html", 35, 795);
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

void colourChooser(int popul) {
  if(popul >= 100000000) {
    fill(0);
    stroke(0);
    popID = 1;
    
  }
  else if(popul < 100000000 && popul >= 50000000) {
    fill(40);
    stroke(40);
    popID = 2;
  }
  else if(popul < 50000000 && popul >= 25000000) {
    fill(80);
    stroke(80);
    popID = 3;
    
  }
  else if(popul < 25000000 && popul >= 10000000) {
    fill(120);
    stroke(120);
    popID = 4;
  }
  else if(popul < 10000000 & popul >= 5000000){
    fill(160);
    stroke(160);
    popID = 5;
  }
  else if(popul < 5000000 && popul > 1000000) {
    fill(190);
    stroke(190);
    popID = 6;
  }
  else { 
    fill(220);
    stroke(220);
    popID = 7;
  }
}

void data() {
  for(TableRow row: table.rows()) {
    float lifeExp = row.getFloat("lifeExp");
    float gdp = row.getFloat("gdpPercap");
    int population = row.getInt("pop");
  //  String continent = row.getString("continent");
    colourChooser(population);
    spaceData(gdp, lifeExp);
    //circle(gdp/10, 500-4*lifeExp, 5);
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

void spaceData(float gdpercap, float lifeEx) { 
  circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), 7);
}

void graphTitle() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont titleFont = createFont("Arial", 24);
  textFont(titleFont);
  text("Graph of GDP per capita vs Life Expectancy for different countries from 1952-2007", 87, 70);
}

void font() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont graphTitleFont = createFont("Arial", 30);
  PFont.list();
  textFont(graphTitleFont);
}
