import processing.svg.*;

//initialise globals
import processing.pdf.*;

Table table;
int contID;
float pixels;

void setup() {
  size(1025, 800, SVG, "Assignment3_1B.svg");
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
  stroke(0);
  PFont markerFont = createFont("Arial", 30);
  textFont(markerFont);
  circle(910, 320, 7);
  text("*", 905, 377);
  rect(907, 395, 7, 7);
  triangle(906, 445, 911, 436, 916, 445);
  textSize(20);
  text("x", 906, 485);
  fill(0);
  PFont keyFont = createFont("Arial", 14);
  textFont(keyFont);
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
    int year = row.getInt("year");
    String continent = row.getString("continent");
   // colourChooser(continent);
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
    
    spaceData(year, lifeExp, contID);
    //circle((year-1900)*contID, 500-4*lifeExp, 5);
  }
}

float lifeExToPixels(float lifeExpec) {
    pixels = (700-((lifeExpec/10)*60));
    return pixels;
}

void spaceData(int yr, float lifeEx, int continentID) {
  if(continentID == 1) {
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
  
  else if(contID == 2) {
    if(yr == 1952) {
        text("*", 105+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1957) {
        text("*", 170+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1962) {
        text("*", 235+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1967) {
        text("*", 300+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1972) {
        text("*", 365+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1977) {
        text("*", 430+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1982) {
        text("*", 495+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1987) {
        text("*", 560+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1992) {
        text("*", 625+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 1997) {
        text("*", 690+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else if(yr == 2002) {
        text("*", 755+10*contID, lifeExToPixels(lifeEx)+16);
      }
    else {
        text("*", 820+10*contID, lifeExToPixels(lifeEx)+16);
      }
  }
  
  else if(contID == 3) {
    if(yr == 1952) {
        rect(109+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1957) {
        rect(174+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1962) {
        rect(239+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1967) {
        rect(304+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1972) {
        rect(369+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1977) {
        rect(434+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1982) {
        rect(499+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1987) {
        rect(564+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1992) {
        rect(629+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 1997) {
        rect(694+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else if(yr == 2002) {
        rect(759+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
    else {
        rect(824+10*contID, lifeExToPixels(lifeEx), 5, 5);
      }
  }
  
  else if(contID == 4) {
    if(yr == 1952) {
        triangle(107+10*contID, lifeExToPixels(lifeEx)+4, 111+10*contID, lifeExToPixels(lifeEx)-3, 115+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1957) {
        triangle(172+10*contID, lifeExToPixels(lifeEx)+4, 176+10*contID, lifeExToPixels(lifeEx)-3, 180+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1962) {
        triangle(237+10*contID, lifeExToPixels(lifeEx)+4, 241+10*contID, lifeExToPixels(lifeEx)-3, 245+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1967) {
        triangle(302+10*contID, lifeExToPixels(lifeEx)+4, 306+10*contID, lifeExToPixels(lifeEx)-3, 310+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1972) {
        triangle(367+10*contID, lifeExToPixels(lifeEx)+4, 371+10*contID, lifeExToPixels(lifeEx)-3, 375+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1977) {
        triangle(432+10*contID, lifeExToPixels(lifeEx)+4, 436+10*contID, lifeExToPixels(lifeEx)-3, 440+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1982) {
        triangle(497+10*contID, lifeExToPixels(lifeEx)+4, 501+10*contID, lifeExToPixels(lifeEx)-3, 505+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1987) {
        triangle(562+10*contID, lifeExToPixels(lifeEx)+4, 566+10*contID, lifeExToPixels(lifeEx)-3, 570+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1992) {
        triangle(627+10*contID, lifeExToPixels(lifeEx)+4, 631+10*contID, lifeExToPixels(lifeEx)-3, 635+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 1997) {
        triangle(692+10*contID, lifeExToPixels(lifeEx)+4, 696+10*contID, lifeExToPixels(lifeEx)-3, 700+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else if(yr == 2002) {
        triangle(757+10*contID, lifeExToPixels(lifeEx)+4, 761+10*contID, lifeExToPixels(lifeEx)-3, 765+10*contID, lifeExToPixels(lifeEx)+4);
      }
    else {
        triangle(822+10*contID, lifeExToPixels(lifeEx)+4, 826+10*contID, lifeExToPixels(lifeEx)-3, 830+10*contID, lifeExToPixels(lifeEx)+4);
      }
  }
  else {
    PFont oFont = createFont("Arial", 16);
    textFont(oFont);
    if(yr == 1952) {
        text("x", 108+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1957) {
        text("x", 173+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1962) {
        text("x", 238+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1967) {
        text("x", 303+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1972) {
        text("x", 368+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1977) {
        text("x", 433+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1982) {
        text("x", 498+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1987) {
        text("x", 563+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1992) {
        text("x", 628+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 1997) {
        text("x", 693+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else if(yr == 2002) {
        text("x", 758+10*contID, lifeExToPixels(lifeEx)+3);
      }
    else {
        text("x", 823+10*contID, lifeExToPixels(lifeEx)+3);
      }
      font();
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
