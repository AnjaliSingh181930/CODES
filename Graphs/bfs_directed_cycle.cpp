//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;

// } Driver Code Ends
class Solution {
  public:
    int bfs_cycle(unordered_map <int, vector<int>> &adj, queue <int> &q, vector<int> &indegree){
        
        int count = 0;
        
        while(!q.empty()){
            int v = q.front();
            count++;
            q.pop();
            
            for(int u : adj[v]){
                indegree[u]--;
                if(indegree[u] == 0){
                    q.push(u);
                }
            }
        }
        //cout <<"Count: "<<count<<" ";
        return count;
        
    }
    
    // Function to detect cycle in a directed graph.
    bool isCyclic(int V, vector<vector<int>> mp) {
        // code here
        
        if(V <= 1) return false;
        
        unordered_map <int, vector<int>> adj;
        vector<int> indegree(V, 0);
        
        for( int i = 0; i<V; i++){
            for( int v : mp[i]){
                adj[i].push_back(v);
                indegree[v]++;
            }
        }
        
        queue <int> q;
        
        for(int i = 0; i<V; i++){
            if(indegree[i] == 0)
                q.push(i);
        }
        
        if(bfs_cycle(adj, q, indegree) == V) return false;
        else return true;
        
    }
};

//{ Driver Code Starts.

int main() {

    int t;
    cin >> t;
    while (t--) {
        int V, E;
        cin >> V >> E;

        vector<vector<int>> adj(V);

        for (int i = 0; i < E; i++) {
            int u, v;
            cin >> u >> v;
            adj[u].push_back(v);
        }

        Solution obj;
        cout << obj.isCyclic(V, adj) << "\n";

        cout << "~"
             << "\n";
    }

    return 0;
}

// } Driver Code Ends