class Solution {
public:
    //a graph with any odd length cycle is not bipartite, other all graphs are bipartite
    //run bfs to detect all cycles and count their length
    bool bipartite_dfs(vector<vector<int>> &graph, vector<int> &visited, int u, int curColour){
        visited[u] = curColour;
        curColour = 1 - curColour;

        for(int v: graph[u]){
            if(visited[v] == 1- curColour)
                return false;
            
            if(visited[v] == -1 and !bipartite_dfs(graph, visited, v, curColour))
                return false;
        }
        return true;
    }

    bool isBipartite(vector<vector<int>>& graph) {
        
        vector<int> visited(graph.size(),-1); //-1 means not visited
        
        for(int i =0; i< graph.size(); i++){
            if(visited[i] == -1 and !bipartite_dfs(graph, visited, i, 1))
                return false;
        }
        return true;
    }
};