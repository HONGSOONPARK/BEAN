package bean.test;

public class 양방향리스트 {

    private Node header;
    private int size;

    public 양방향리스트(){
        header = new Node(null);
        size=0;
    }

    private  class Node{

        private Object data;
        private Node previousNode;
        private Node nextNode;

        Node(Object data){

            this.data = data;
            this.previousNode = null;
            this.nextNode = null;

        }
    }


    public Object get(int index){
        return getNode(index).data;
    }

    private Node getNode(int index){

        if(index < 0 || index > size){
            throw new IndexOutOfBoundsException("Index : "+index+", Size : " + size);
        }

        Node node = header;

        // index 가 리스트 size의 중간 앞이면 순차적으로 탐색한다.
        if(index < (size/2)){

            for(int i =0; i<=index; i++){
                node = node.nextNode;
            }

        }else{
            // index가 리스트 size의 중간보다 뒤면 뒤에서부터 탐색한다.
            for(int i = size; i > index; i--){
                node = node.previousNode;

            }
        }

        return node;


    }
}







