//{ Driver Code Starts
#include<bits/stdc++.h>
using namespace std;

// } Driver Code Ends
class Solution
{
    public:
    
    vector<int> parent;
    vector<int> rank;
    
    void initialize_vec(int V){
        
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
    
    //Function to detect cycle using DSU in an undirected graph.

    //If two nodes having a edge between them have same parent, it means there is a cycle.
	int detectCycle(int V, vector<int>adj[])
	{
	    // Code here
	    initialize_vec(V);
	    
	    for(int i =0; i< V; i++)
	        for(int u : adj[i])
	            if( i < u){
	                if(find_dsu(i) == find_dsu(u))
	                    return 1;
	                union_dsu(i,u);
	            }
	    
	    return 0;  
	}
};

//{ Driver Code Starts.
int main(){
	int tc;
	cin >> tc;
	while(tc--){
		int V, E;
		cin >> V >> E;
		vector<int>adj[V];
		for(int i = 0; i < E; i++){
			int u, v;
			cin >> u >> v;
			adj[u].push_back(v);
			adj[v].push_back(u);
		}
		Solution obj;
		int ans = obj.detectCycle(V, adj);
		cout << ans <<"\n";	
cout << "~" << "\n";
}
	return 0;
}
// } Driver Code Ends