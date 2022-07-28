#include <iostream>

double GetBlockReward(int blockHeight, int halvingInterval)
{
    int halvings = blockHeight / halvingInterval;
    double reward = 50; // Initial reward is 50 coins per block
    return reward;
}
int main()
{
    double reward = GetBlockReward(1, 21000);
    std::cout << reward;
    return 0;
}
