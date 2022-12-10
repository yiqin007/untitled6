package item2;

import static java.lang.Math.min;

/**
 * @author 叶嘉卫
 * @date 2022/12/09/22:28
 * @Description: 动态规划
 */
public class Solution {
        public int minPathSum(int[][] grid) {
                int row=grid.length;
                int col= grid[0].length;
                for (int i = 1; i < col; i++) {//第一行
                        grid[0][i]=grid[0][i-1]+grid[0][i];
                }
                for (int i = 1; i < row; i++) {
                        grid[i][0]=grid[i-1][0]+grid[i][0];
                }
                for (int i = 1; i < row; i++) {
                        for (int j = 1; j < col; j++) {
                                grid[i][j]+=Math.min(grid[i-1][j],grid[i][j-1]);
                        }
                }
                return  grid[row-1][col-1];
        }

}
