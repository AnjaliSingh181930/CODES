//{ Driver Code Starts
#include <bits/stdc++.h>
using namespace std;

// } Driver Code Ends
// class Solution {
//   public:
//     bool dfs(unordered_map <int, vector<int>> &adj, int u, vector<bool> &visited, vector<bool> &inRecursion){
 
//         visited[u] = true;
//         inRecursion[u] = true;
        
//         for(int v : adj[u]){
//             if(visited[v] & inRecursion[v])
//                 return true;
//             if (!visited[v] & dfs(adj, v, visited, inRecursion))
//                 return true;
//         }
        
//         inRecursion[u] = false;
        
//         return false;
//     }
    
//     // Function to detect cycle in a directed graph.
//     bool isCyclic(int V, vector<vector<int>> mp) {
//         // code here
//         unordered_map <int, vector<int>> adj;
        
//         for( int i = 0; i<V; i++){
//             for( int v : mp[i]){
//                 adj[i].push_back(v);
//             }
//         }
        
//         vector <bool> visited(mp.size(), 0);
//         vector <bool> inRecursion(mp.size(), 0);
//         bool ans;
        
//         for(int i = 0; i< mp.size(); i++){
//             if(!visited[i] & dfs(adj, i, visited, inRecursion))
//                 return true;
//         }
        
//         return false;
//     }
// }; //TC = O(V+E), SC = O(V+E)

class Solution {
    public:
    bool dfs(vector<int> &visited, int u, unordered_map <int, vector<int>> &adj,  vector<int> &result){

        visited[u] = -1;

        for(auto &v: adj[u]){
            if(visited[v]== -1)
                return true;
            if(visited[v] == 0 and dfs(visited, v, adj, result))
                return true;
        }

        visited[u] = 1;
        result.push_back(u);
        cout<<"Hii";
        
        return false;
    }

    bool isCyclic(int numCourses, vector<vector<int>>& prerequisites) {
         
        unordered_map <int, vector<int>> adj;

        for (auto &vec: prerequisites){
            adj[vec[1]].push_back(vec[0]);
        }

        vector<int> visited(numCourses ,0); //0 not visited, -1 inrecusrion, 1 not inrecursion
        vector<int> result;

        for( int i = 0; i < numCourses; i++){
            if(!visited[i] and dfs(visited, i, adj, result))
                return {};
        }

        reverse(result.begin(), result.end());
        if(result.size() != numCourses) return true; //there is cycle
        else return false; //no cycle
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