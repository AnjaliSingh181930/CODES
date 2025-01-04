#include <bits/stdc++.h>
using namespace std;

class Solution {
public:

    void topo_sort(unordered_map <int, vector<int>> &adj, vector<int> &result, vector<int> &indegree, queue <int> q){

        while(!q.empty()){
            int v = q.front();
            q.pop();
            result.push_back(v);

            for(int u : adj[v]){
                indegree[u]--;
                if(indegree[u] == 0)
                    q.push(u);
            }
        }

    }
    vector<int> findOrder(int numCourses, vector<vector<int>>& prerequisites) {
        unordered_map <int, vector<int>> adj;

        for(int i = 0; i< prerequisites.size(); i++){
            for (int v : prerequisites[i]){
                adj[i].push_back(v);
            }
        }

        vector <int> indegree(numCourses, 0);
        vector <int> result;
        queue <int> q;

        for(int i = 0; i< prerequisites.size(); i++){
            for (int v : adj[i]){
                indegree[v]++;
            }
        }

        for(int i = 0; i< prerequisites.size(); i++){
            if(indegree[i] == 0)
                q.push(i);          
        }

        topo_sort(adj, result, indegree, q);

        return result; 
    }
};