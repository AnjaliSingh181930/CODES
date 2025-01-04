//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;


// } Driver Code Ends
class Solution {
  public:
    
    void bfs_topo(vector<vector<int>> &adj, vector<int> &result, vector<int> &indegree, queue <int> q){
        
        while(!q.empty()){
            
            int v = q.front();
            result.push_back(v);
            q.pop();
            
            //cout<< v<<endl;
            
            for(int u: adj[v]){
                indegree[u]--;
                if(indegree[u] == 0)
                    q.push(u);
            }
        }
    }    
    
    // Function to return list containing vertices in Topological order.
    vector<int> topologicalSort(vector<vector<int>>& mp) {
        // Your code here
        
        //vector <bool> visited(mp.size(), false);
        vector <int> result;
        vector<int> indegree(mp.size(), 0);
        queue <int> q;
        
        //Calculate indegree
        for(int i = 0; i<mp.size(); i++){
            for (int v : mp[i]){
                indegree[v]++;
            }
        }
        
        //push 0 indegree elements
        for(int i = 0; i<indegree.size(); i++){
            if(indegree[i] == 0)
                q.push(i);
        }
        
        bfs_topo(mp, result, indegree, q);
        
        return result;  
    }
};  //TC = O(V+E), SC = O(V)

//{ Driver Code Starts.

/*  Function to check if elements returned by user
 *   contains the elements in topological sorted form
 *   V: number of vertices
 *   *res: array containing elements in topological sorted form
 *   adj[]: graph input
 */
int check(int V, vector<int> &res, vector<vector<int>> adj) {

    if (V != res.size())
        return 0;

    vector<int> map(V, -1);
    for (int i = 0; i < V; i++) {
        map[res[i]] = i;
    }
    for (int i = 0; i < V; i++) {
        for (int v : adj[i]) {
            if (map[i] > map[v])
                return 0;
        }
    }
    return 1;
}

int main() {
    int T;
    cin >> T;
    while (T--) {
        int N, E;
        cin >> E >> N;
        int u, v;

        vector<vector<int>> adj(N);

        for (int i = 0; i < E; i++) {
            int u, v;
            cin >> u >> v;
            adj[u].push_back(v);
        }

        Solution obj;
        vector<int> res = obj.topologicalSort(adj);

        cout << check(N, res, adj) << endl;

        cout << "~"
             << "\n";
    }

    return 0;
}
// } Driver Code Ends