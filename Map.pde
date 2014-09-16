


class Map {
    Node [][] gameMap; 
    ArrayList <Node> openList;
    ArrayList <Node> closedList;
    int mapWidth, mapHeight;
    int resolution; 
    
    Map(int mapWidth, int mapHeight, int resolution) {
        this.mapWidth = mapWidth;
        this.mapHeight = mapHeight;
        this.resolution = resolution;
        initializeMap(); 
    }

    void initializeMap() {

        
        gameMap = new Node[mapWidth][mapHeight];
        
        for(int i = 0; i < mapWidth / resolution; i++) {
            for(int j = 0; j < mapHeight / resolution; j++) { 
                
                gameMap[i][j] = new Node(i, j);
            }
        } 
    }


    /////////////////////////////////////////////////////////////////////

    ArrayList <Node> findPath(Character character, Node destination) {
        ArrayList <Node> path = new ArrayList<Node>();
        closedList = new ArrayList<Node>();
        openList = new ArrayList<Node>();

        Node startNode = new Node((int)character.x / resolution, 
                                  (int)character.y / resolution);
        Node endNode = new Node((int)destination.x / resolution, 
                                (int)destination.y / resolution);
                                
        startNode.cost = 0;     
        startNode.prevIndex = -1;
        println(endNode.x + "  " + endNode.y); 
        //for(int i = 0; i < 10; i++){
        while(true) {
            closedList.add(startNode);
            if(foundDestination(startNode, endNode))
                return getFoundPath(startNode); 
            addSurroundingToOpenList(startNode, endNode);
            
            int lowestIndex = getNodeIndexOfLowestCost(endNode);
            startNode = new Node(openList.get(lowestIndex));
            println(startNode.x + " " + startNode.y + " " + lowestIndex);
            openList.remove(lowestIndex);
        }
        //return path;
    }

    void addSurroundingToOpenList(Node startNode, Node endNode) {
        ///println(startNode.x + " " + startNode.y);
        //println(closedList.size());
        if(validNodeToAdd(startNode.x - 1, startNode.y))
            openList.add(new Node(startNode.x - 1, startNode.y, startNode.cost + 10, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x + 1, startNode.y))
            openList.add(new Node(startNode.x + 1, startNode.y, startNode.cost + 10, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x, startNode.y - 1))
            openList.add(new Node(startNode.x, startNode.y - 1, startNode.cost + 10, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x, startNode.y + 1))
            openList.add(new Node(startNode.x, startNode.y + 1, startNode.cost + 10, closedList.indexOf(startNode)));
            
        if(validNodeToAdd(startNode.x - 1, startNode.y - 1))
            openList.add(new Node(startNode.x - 1, startNode.y - 1, startNode.cost + 14, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x + 1, startNode.y + 1))
            openList.add(new Node(startNode.x + 1, startNode.y + 1, startNode.cost + 14, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x + 1, startNode.y - 1))
            openList.add(new Node(startNode.x, startNode.y - 1, startNode.cost + 14, closedList.indexOf(startNode)));
        
        if(validNodeToAdd(startNode.x - 1, startNode.y + 1))
            openList.add(new Node(startNode.x, startNode.y + 1, startNode.cost + 14, closedList.indexOf(startNode)));         

    }

    boolean validNodeToAdd(int x, int y) {
        if(x < 0 && x >= mapWidth && y < 0 && y >= mapHeight) 
            return false;
        for(Node node : closedList) {
          // println(node.x + " " + node.y + " " + x + " " +y);  
          if(node.x == x && node.y == y) {
                return false;
                
          }
        }  
        return true;
    }

    boolean foundDestination(Node location, Node destination) {
        if(location.x != destination.x || location.y != destination.y)
            return false;
        return true;
    }

    ArrayList<Node> getFoundPath(Node endNode){
        ArrayList <Node> path = new ArrayList<Node>();

        int currentIndex = endNode.prevIndex;
         println(currentIndex); 
        while(true) {
          
          endNode = closedList.get(currentIndex);           
          rect(endNode.x * resolution, endNode.y * resolution, resolution, resolution);  
          
          if(endNode.prevIndex != -1)
            currentIndex = endNode.prevIndex;
          else
           break; 
        }
        return path;
    }

    int getNodeIndexOfLowestCost(Node endNode) {
        if(openList.size() > 0) {
            int index = 0;
            int lowestCost = height * width;
            println("-----------------" + openList.size());
            for(int i = 0; i < openList.size(); i++) {
                println(openList.get(i).x + " " + openList.get(i).y + " " + openList.get(i).cost);
                if(openList.get(i).cost + getManhattanValue(openList.get(i), endNode) < lowestCost) {
                    lowestCost = openList.get(i).cost + getManhattanValue(openList.get(i), endNode);
                    index = i;
                }

            }
            println("-----------------");
            return index;
        }
        return -1;
    }

    int getManhattanValue(Node start, Node end) {
        println("M:" +start.x + " " + start.y + " " + end.x + " " + end.y);
        int xCost = abs(start.x - end.x) * 10;
        int yCost = abs(start.y - end.y) * 10;
        return xCost + yCost;
    }



    
}
