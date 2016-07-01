import processing.serial.*;

int COMPORT = 1;

int BAUDRATE = 9600;

int HIGHEST_DATA_IN = 255;

int numberDataStreams = 7;

String dataIn;

String [] dataString = new String[numberDataStreams];

int[] dataNumber = new int[numberDataStreams];

Serial teensySerial;

Line data;
Line data2;
Line data3;

//class for drawing the graph lines
class Line{
  
  int x,y;
  int lastX = 0;
  int lastHeight = height;
  int COLOR = 255;
  int SCALE = 20;
  
  Line(){
  }
  
  
  Line(int yPos, int c, int s){
    y = yPos;
    COLOR = c;
    SCALE = s;
  }

  
  void Draw(int y, int COLOR, int SCALE){
    
    
    stroke(COLOR);
    
    //Clears the screen when the line touches the edge of the window
    //then clears and resets the line's x postion to zero (0)
    
    if(x <= width){
      
        x+=SCALE;
        
        line(lastX,lastHeight,x, y);
        
        
        //stores the last postion of the lines right most point
        
        lastHeight = y;
        
        lastX = x;
        
    }else{
      
        x  = 0;
        
        lastX = 0;
        
        background(0); 
        

    }
  }
  
  
}




void printSerialPortsAvialible(){
  
  String list[] = Serial.list();
    
    for(int i = 0; i < list.length; i++){
      
      println("Com Port " + i + " = " + list[i]);
      
    }
    
    print("\n\n");
}




void setup () {
  
  size(1000, 600);   
  background(0); 
  
  
  textSize(26);
  

  data  = new Line();
  data2 = new Line();
  
  printSerialPortsAvialible();
  
  
  try{
    
    teensySerial = new Serial(this, Serial.list()[COMPORT], BAUDRATE);
    
  }catch(ArrayIndexOutOfBoundsException e ){
    
    System.err.println("ArrayIndexOutOfBoundsException: " + e.getMessage());
    
  }
}

void serialGetData(){
  
    if(teensySerial.available() > 0)
  {
    
    dataIn = teensySerial.readStringUntil('\n');
    
    if(dataIn != null)
    {
      try{
            dataIn     = trim(dataIn);
            dataString = split(dataIn, ',');
            
            for(int i = 0; i < dataNumber.length; i++)
            {
              
              dataNumber[i] = int( map( int(dataString[i]), 0, HIGHEST_DATA_IN, 0, height));
              
              print(dataNumber[i] + ", ");
              
            }
            
            println();
            
      }catch(ArrayIndexOutOfBoundsException e ){
        
       System.err.println("ArrayIndexOutOfBoundsException: " + e.getMessage());
       
     }
      
    }
      
  }
}

void draw () {
  
  text("1/2", width / 20,(height/2));
  
  line(0, height/2, width / 20, height/2);
  
  text("1/4", width / 20,(height/4));
  
  line(0, height/4, width / 20, height/4);
  
  text("3/4", width / 20,((height/4)+(height/2)));
  
  line(0, ((height/4)+(height/2)), width / 20, ((height/4)+(height/2)));
  
  
  serialGetData();
  
  data.Draw(dataNumber[0],255, 1);
  
  data2.Draw(dataNumber[6],#00ff00, 1);
  
  
 
}