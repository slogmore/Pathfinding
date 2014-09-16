

class Node {
    int x, y;
    int cost;
    Node parent;
    int prevIndex;
    
    Node(Node node) {
        this.x = node.x;
        this.y = node.y;
        this.cost = node.cost;
        this.prevIndex = node.prevIndex;
      
    }

    Node(int x, int y) {
        this.x = x;
        this.y = y; 
        this.cost = 0;
      
    }

    Node(int x, int y, int cost, int prevIndex) {
        this.x = x;
        this.y = y;
        this.cost = cost;
        this.prevIndex = prevIndex;
        
    }


}
