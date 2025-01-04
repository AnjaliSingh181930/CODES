//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;


// } Driver Code Ends
class Solution {
  public:
  
    bool dfs(unordered_map <int, vector<int>> &adj, int u, int parent, vector<bool> &visited){
 
        visited[u] = true;
        
        for(int v : adj[u]){
            if(v == parent)
                continue;
            if(visited[v])
                return true;
            if (dfs(adj, v, u, visited))
                return true;
        }
        
        return false;
    }
    
    // Function to detect cycle in an undirected graph.
    bool isCycle(vector<vector<int>>& mp) {
        // Code here
        
        unordered_map <int, vector<int>> adj;
        
        for( int i = 0; i<mp.size(); i++){
            for( int v : mp[i]){
                adj[i].push_back(v);
            }
        }
        
        vector <bool> visited(mp.size(), 0);
        bool ans;
        
        for(int i = 0; i< mp.size(); i++){
            if(!visited[i] & dfs(adj, i, -1, visited))
                return true;
        }
        
        return false;
    }
};


//{ Driver Code Starts.
int main() {
    int tc;
    cin >> tc;
    while (tc--) {
        int V, E;
        cin >> V >> E;
        vector<vector<int>> adj(V);
        for (int i = 0; i < E; i++) {
            int u, v;
            cin >> u >> v;
            adj[u].push_back(v);
            adj[v].push_back(u);
        }
        Solution obj;
        bool ans = obj.isCycle(adj);
        if (ans)
            cout << "1\n";
        else
            cout << "0\n";

        cout << "~"
             << "\n";
    }
    return 0;
}
// } Driver Code Ends