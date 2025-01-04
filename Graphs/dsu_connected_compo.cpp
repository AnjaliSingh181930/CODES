class Solution {
public:
    vector<int> parent;
    vector<int> rank;
    
    void initialise_vec(int V){
        
        parent.resize(V);    // Resize to the number of vertices
        rank.resize(V, 1);   // Initialize rank to 1 for each vertex
        
        for(int i =0; i< V; i++)
	        parent[i] = i;
    }
    
    int find_dsu(int x){
        if( x == parent[x])
            return x;
        return parent[x] = find_dsu(parent[x]);
    }
    
    void union_dsu(int x, int y){
        int x_parent = find_dsu(x);
        int y_parent = find_dsu(y);
        
        if(x_parent != y_parent){
            int rank_x = rank[x_parent];
            int rank_y = rank[y_parent];
            
            if(rank_x > rank_y) 
                parent[y_parent] = x_parent;
            else if(rank_x < rank_y) 
                parent[x_parent] = y_parent;
            else{
                parent[y_parent] = x_parent;
                rank[x_parent]++;
            }
        }
    }

    //for n vertices, we need n-1 edges to connect them.
    int makeConnected(int n, vector<vector<int>>& connections) {
        
        //min edges required to connect all n vertices is n - 1.
        if(!(connections.size() >= n-1 ))
            return -1;

        int connected_compo = n;

        initialise_vec(n);

        //connected components reduce when we perform union.
        for(vector<int> i: connections){
            int u = i[0];
            int v = i[1];

            if(find_dsu(u) != find_dsu(v)){
                connected_compo --;
                union_dsu(u,v);
            }
        }

        return connected_compo -1;
    }
};