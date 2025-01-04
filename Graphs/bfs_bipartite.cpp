class Solution {
public:
    //a graph with any odd length cycle is not bipartite, other all graphs are bipartite
    //run bfs to detect all cycles and count their length
    bool bipartite_bfs(vector<vector<int>> &graph, vector<int> &visited, int u, int curColour){
        
        queue <int> q;

        q.push(u);
        visited[u] = curColour;

        while(!q.empty()){
            int v = q.front();
            int colour = visited[v];
            q.pop();

            for(int u: graph[v]){
                if(visited[u] == -1){
                    visited[u] = 1-colour;
                    q.push(u);
                }
                if(visited[u] == colour)
                    return false;
            }
        }
       
        return true;
    }

    bool isBipartite(vector<vector<int>>& graph) {
        
        vector<int> visited(graph.size(),-1); //-1 means not visited
        
        for(int node =0; node< graph.size(); node++){
            if(visited[node] == -1 and !bipartite_bfs(graph, visited, node, 1))
                return false;
        }
        return true;
    }
};

