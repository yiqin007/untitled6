package item1;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

/**
 * @author 叶嘉卫
 * @date 2022/12/09/22:13
 * @Description: dfs
 */
class Solution {
    List<List<Integer>> ans = new ArrayList<List<Integer>>();
    Deque<Integer> stack = new ArrayDeque<Integer>();

    public List<List<Integer>> allPathsSourceTarget(int[][] graph) {
        stack.offerLast(0);
        dfs(graph, 0, graph.length - 1);
        return ans;
    }

    public void dfs(int[][] graph, int x, int n) {
        if (x == n) {
            ans.add(new ArrayList<Integer>(stack));
            return;
        }
        for (int y : graph[x]) {
            stack.offerLast(y);
            dfs(graph, y, n);
            stack.pollLast();
        }
    }
}


