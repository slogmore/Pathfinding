

int mapWidth = 500; 
int mapHeight = 500;
int mapResolution = 5; 
Map gameMap = new Map(mapWidth, mapHeight, mapResolution);
Character myCharacter = new Character(100, 100); 

void setup() {
    size(mapWidth, mapHeight);
    gameMap.findPath(myCharacter, new Node(400, 300));  

}


void draw() {

    
}


