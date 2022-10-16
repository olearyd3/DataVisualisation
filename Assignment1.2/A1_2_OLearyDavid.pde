//CSU44056 DATA VISUALISATION ASSIGNMENT 1.2 - DAVID O'LEARY 19333494
import processing.pdf.*;

// initialise globals
Table table;
boolean bool = false;
boolean boolvar = false;
float tempLongitude;
float tempLatitude;
float prevLatit;
float tempLont;
String prevDir;
int prevDiv;
int prevSurvivors;
int count = 0;

// A4 size sheet
void setup() {
  size(1053, 744, PDF, "A1.2_OLearyDavid.pdf");
  //size(1053, 744);
  
  // load in the Excel data provided
  table = loadTable("minard-data.csv", "header");
}

// main draw() function
void draw() {
  // set the background colour to honeysuckle
  background(240, 240, 200);
  // change the fill and stroke colours to black to draw outer border
  fill(0);
  strokeWeight(1);
  stroke(0);
  //draw outer border of the visualisation
  fill(113, 186, 101);
  rect(37, 165, 979, 333);
  line(35, 500, 1018, 500);
  line(35, 163, 1018, 163);
  line(35, 163, 35, 500);
  line(1018, 163, 1018, 500);
  line(20, 40, 1033, 40);
  line(20, 704, 1033, 704);
  line(20, 40, 20, 704);
  line(1033, 40, 1033, 704);
  // function to draw the title 
  makeTitle();
  // plot the path to Moscow 
  drawJourney();
  // connect the temp graph to the map
  connectingGraphtoMap();
  //plot the city names
  cityNames();
  // graph the temperature for return trip
  tempGraph();
  // adding some survivor numbers that weren't in CSV data for start and end
  PFont numSFont = createFont("Times New Roman", 10);
  textFont(numSFont);
  strokeWeight(1);
  fill(0, 0, 230);
  stroke(0, 0, 230);
  text("422000", 55, 293);
  line(55, 295, 84, 295);
  text("start", 61, 302);
  fill(80);
  stroke(80);
  text("6000", 90, 240);
  text("10000", 55, 432);
  line(55, 434, 80, 434);
  text("end", 60, 441);
  fill(240, 240, 200);
  rect(200, 517, 712, 25);
  fill(0);
  //add the graph title
  PFont graphTitleFont = createFont("Times New Roman", 20);
  textFont(graphTitleFont);
  text("Graph of the temperature in degrees of Réaumur thermometer during the return journey", 205, 536);
  // add exit(); for pdf production
  exit();
}

// function to make the title, key and my name
void makeTitle() {
  //fill a rectangle with the fern green colour to represent land
  fill(113, 186, 101);
  rect(884, 447, 132, 51);
  // change colour of fill() back to black
  fill(0);
  // use Times New Roman size 40 for title
  PFont titleFont = createFont("Times New Roman", 40);
  textFont(titleFont);
  text("Map of the Russian Campaign of 1812-1813 depicting", 83, 90);
  text("the terrible loss of French soliders", 245, 140);
  // change font size to 14
  PFont keyFont = createFont("Times New Roman", 14);
  textFont(keyFont);
  // vertically write the word KEY
  text("K", 888, 463);
  text("E", 888, 479);
  text("Y", 888, 495);
  //change font size for my name
  PFont nameFont = createFont("Times New Roman", 12);
  textFont(nameFont);
  text("David O'Leary (19333494)", 897, 698);
  text("CSU44056 Assignment 1.2", 27, 698);
  // change font size for key info
  PFont keySubFont = createFont("Times New Roman", 10);
  textFont(keySubFont);
  text("Troops travelling ", 932, 460);
  text("towards the attack ", 932, 470);
  text("Troops returning ", 932, 483);
  text("after the attack ", 932, 493);
  // draw outline of key box
  line(884, 447, 1016, 447);
  line(884, 447, 884, 498);
  line(900, 447, 900, 498);
  // attack key marker
  stroke(32, 179, 232);
  fill(32, 179, 232);
  strokeWeight(2);
  circle(915, 460, 10);
  //return marker
  stroke(140);
  fill(140);
  strokeWeight(2);
  circle(915, 483, 10);
}

// function to determine width of lines for troops journey
void lineThickness(float longp, float latip, int surv, int prevSurv, float prevLong, float prevLat, String dir, int division, int prevDivision, String prevDir) {
  //if the troops are attacking
  if((dir.equals("A") == true || prevDir.equals("A") == true) && division == prevDivision) {
    /// set the colour to summer sky blue
    stroke(32, 179, 232);
    fill(32, 179, 232);
    strokeWeight(2);
    //draw quadrilaterals from each previous datapoint to the next ones
    quad(prevLong, prevLat+(prevSurv/8000), prevLong, prevLat-(prevSurv/8000), longp, latip-(surv/8000), longp, latip+(surv/8000));
    // plot every third survivor number to not overcrowd map
    if(count%3 == 0 && (surv != 140000 && surv != 340000 && surv != 60000)) {
      //change to dark blue 
      fill(0, 0, 230);
      text(surv, longp+5, latip-(surv/8000)-15);
    }
  }
  //if the troops are returning
  if((dir.equals("R") == true && prevDir.equals("R") == true) && (division == prevDivision)) {
    // set colour to dark grey
    stroke(180);
    fill(180);
    strokeWeight(2);
    // draw quadrilaterals
    quad(prevLong, prevLat+(prevSurv/8000), prevLong, prevLat-(prevSurv/8000), longp, latip-(surv/8000), longp, latip+(surv/8000));
    // omit every second survivor count for clarity
    if(count%2 == 0 && (surv != 6000 && surv != 20000)) {
      fill(80);
      text(surv, longp, latip+(surv/8000)+15);
    }
  }
}

//function to draw the temperature graph at the bottom
void tempGraph() {
  // set colour to black
  stroke(0);
  strokeWeight(1);
  fill(0);
  // set up the outline of the graph and temperature scale
  line(160, 560, 980, 560);
  text("°R", 117, 542);
  text("°C", 77, 542);
  text("0", 125, 562);
  text("0", 85, 562);
  line(160, 590, 980, 590);
  text("-10", 115, 592);
  text("-13", 75, 592);
  line(160, 620, 980, 620);
  text("-20", 115, 622);
  text("-25", 75, 622);
  line(160, 650, 980, 650);
  text("-30", 115, 652);
  text("-38", 75, 652);
  float latit;
  // read in the data for longitude, temp and date
  for(TableRow row : table.rows()) {
    float lont = longConversion(row.getFloat("LONT"));
    int temp = row.getInt("TEMP");
    String tempStr = str(temp);
    String day = row.getString("DAY");
    String month = row.getString("MON");
    String temperatureAndDate = tempStr + "°R " + day + " " + month;
    //plotting the points on the temperature graph using absolute value and multiplying it by scale and adding line latitude
    latit = 3*abs(temp) + 560;
    // plot the temperature and dates
    if(temperatureAndDate.length() >= 6) {
      PFont cityLabel = createFont("Times New Roman", 9);
      textFont(cityLabel);
      strokeWeight(1);
      fill(0);
      text(temperatureAndDate, lont-10, latit+11);
    }
    // bug fixing to stop a line being drawn to (0, ?) by the data
    if(lont >= 100) {
      stroke(150);
      line(lont, latit, lont, 501);
      stroke(0, 0, 255);
      fill(0, 0, 255);
      circle(lont, latit, 3);
      // don't plot line when only first data point exists 
      if(boolvar == true) {  
        strokeWeight(2);
        line(lont, latit, tempLont, prevLatit);
      }
    }
    // start plotting lines connecting the data
    boolvar = true;
    // convert longitude
    tempLont = longConversion(row.getFloat("LONT"));
    // calculate previous latitude
    prevLatit = 3*abs(temp) + 560;
  }
}

// function to plot the troops journey
void drawJourney() {
  // set colour to dim grey
  stroke(100);
  fill(100);
  strokeWeight(1);
  // draw lines of latitude on the map
  line(37, 463.5, 883, 463.5);
  line(37, 330, 1016, 330);
  line(37, 196.5, 1016, 196.5);
  text("56°N", 40, 194.5);
  text("55°N", 40, 328);
  text("54°N", 40, 461.5);
  // read in data from Excel sheet
  for(TableRow row : table.rows()) {
    float lonp = longConversion(row.getFloat("LONP"));
    float latp = latConversion(row.getFloat("LATP")); 
    String direction = row.getString("DIR");
    int div = row.getInt("DIV");
    int survivors = row.getInt("SURV");
    // this counter is used in lineThickness() to only plot certain survivor counts
    count++;
    // make sure to only do this from second iteration on, so that two values exist for latp, longp etc..
    // draw a quadrilateral of the right size for each progressive survivor count and long-lat coords
    if(bool == true) {    
      lineThickness(lonp, latp, survivors, prevSurvivors, tempLongitude, tempLatitude, direction, div, prevDiv, prevDir);
    }
    // change flag to true
    bool = true;
    // convert longitude and latitude 
    tempLongitude = longConversion(row.getFloat("LONP"));
    tempLatitude = latConversion(row.getFloat("LATP"));
    prevDir = row.getString("DIR");
    prevDiv = row.getInt("DIV");
    prevSurvivors = row.getInt("SURV");
    // change colour to white
    fill(255);
  }
}

// function to plot city names
void cityNames() {
  // read in Excel data
  for(TableRow row : table.rows()) {
    float longitude = longConversion(row.getFloat("LONC"));
    float latitude = latConversion(row.getFloat("LATC"));
    String city = row.getString("CITY");
    PFont cityLabel = createFont("Times New Roman", 12);
    // colour to black
    stroke(0);
    fill(0);
    circle(longitude, latitude, 4);
    // make Moscou bigger since this is the final destination of the attack
    if(city.equals("Moscou") == true) {
      cityLabel = createFont("Times New Roman", 24);
      textFont(cityLabel);
      text(city, longitude-50, latitude-5);
    }
    // all other cities are regular size
    else {
      textFont(cityLabel);
      text(city, longitude, latitude-3);
    }
  }
}

// function to draw light lines connecting graph to map
void connectingGraphtoMap() {
  strokeWeight(1);
  // set colour to shady lady grey
  stroke(150);
  // plot each line
  line(161.32, 497, 161.32, 404);
  line(254.28, 497, 254.28, 423);
  line(287.48, 497, 287.48, 411);
  line(373.8, 497, 373.8, 439);
  line(420.28, 497, 420.28, 429);
  line(606.2, 497, 606.2, 387);
  line(685.88, 497, 685.88, 363);
  line(871.8, 497, 871.8, 319);
  line(978.04, 446, 978.04, 238);
}

// function to convert longitudes provided to fit on the map
float longConversion(float longitude) {
  return (longitude - 24)*66.4 + 75; 
}

// function to convert latitudes provided to fit on the map
float latConversion(float latitude) {
  return (90 - latitude - 35)*133.5 + 330;
}
