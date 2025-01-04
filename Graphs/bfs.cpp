//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;


// } Driver Code Ends
class Solution {
  public:
  
    void bfs(unordered_map <int, vector<int>> &adj, vector<bool> &visited, vector<int> &result, int u){
        visited[u] = true;
        
        queue<int> q;
        q.push(u);
        result.push_back(u);
        
        while(!q.empty()){
            
            u = q.front();
            q.pop();
        
            for(int v:adj[u]){
                if(!visited[v]){
                    visited[v] = true;
                    q.push(v);
                    result.push_back(v);
                }
            }
            
        }
        
    }
    
    // Function to return Breadth First Traversal of given graph.
    vector<int> bfsOfGraph(vector<vector<int>> &mp) {
        // Code here
        
        unordered_map <int, vector<int>> adj;
        
        for(int i =0; i< mp.size(); i++){
            for(int j : mp[i]){
                adj[i].push_back(j);
            }
        }
        
        vector<bool> visited(mp.size(), false);
        vector<int> result;
        
        for(int i =0; i< mp.size(); i++)
            if(!visited[i])
                bfs(adj, visited, result, 0);
        
        return result;
    }
}; // TC = O(V+E) , SC = O(V)

//{ Driver Code Starts.

int main() {
    int tc;
    cin >> tc;
    while (tc--) {
        int V, E;
        cin >> V >> E;

        // Now using vector of vectors instead of array of vectors
        vector<vector<int>> adj(V);

        for (int i = 0; i < E; i++) {
            int u, v;
            cin >> u >> v;
            adj[u].push_back(v);
            adj[v].push_back(u);
        }

        Solution obj;
        vector<int> ans = obj.bfsOfGraph(adj);
        for (int i = 0; i < ans.size(); i++) {
            cout << ans[i] << " ";
        }
        cout << endl;
        cout << "~" << endl;
    }
    return 0;
}

// } Driver Code Ends