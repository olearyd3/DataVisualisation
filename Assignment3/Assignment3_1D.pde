import processing.svg.*;

//initialise globals
import processing.pdf.*;

Table table;
int contID;
float pixels;

void setup() {
  size(1025, 800, SVG, "Assignment3_1D.svg");
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
  text("Population", 915, 320);
  
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
  fill(219, 161, 2);
  circle(920, 355, 50);
  circle(920, 400, 25);
  circle(920, 430, 10);
  circle(920, 453, 5);
  circle(920, 470, 1.5);
  fill(0);
  text("50 million", 952, 360);
  text("25 million", 952, 405);
  text("10 million", 952, 435);
  text("5 million", 952, 457);
  text("1.5 million", 952, 475);
  
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

void colourChooser(String cont) {
  if(cont.equals("Asia")) {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    contID = 1;
    
  }
  else if(cont.equals("Africa")) {
    fill(0, 200, 0);
    stroke(0, 200, 0);
    contID = 2;
  }
  else if(cont.equals("Europe")) {
    fill(0, 0, 150);
    stroke(0, 0, 150);
    contID = 3;
    
  }
  else if(cont.equals("Americas")) {
    fill(0, 200, 200);
    stroke(0, 200, 200);
    contID = 4;
  }
  else {
    fill(220, 0, 220);
    stroke(220, 0, 220);
    contID = 5;
  }
}

void data() {
  for(TableRow row: table.rows()) {
    float lifeExp = row.getFloat("lifeExp");
    float gdp = row.getFloat("gdpPercap");
    int population = row.getInt("pop");
  //  String continent = row.getString("continent");
  //  colourChooser(continent);
    spaceData(gdp, lifeExp, population);
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

void spaceData(float gdpercap, float lifeEx, int popul) {
  fill(219, 161, 2);

  stroke(0);
    if(popul/10000000 < 1.5) {   
      circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), 1.5);
    }
    //else if(popul/10000000 > 40) {
    //  circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), 40);
    //}
    else {
      circle(105 + gdpercap/76.92, lifeExToPixels(lifeEx), popul/10000000);
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

void font() {
  fill(0);
  stroke(0);
  strokeWeight(1);
  PFont graphTitleFont = createFont("Arial", 30);
  PFont.list();
  textFont(graphTitleFont);
}
