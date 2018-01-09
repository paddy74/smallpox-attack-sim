/**
 * Author: Patrick T Cox
 * Date of Creation: 15 September 2017
 * Last Updated: 15 December 2017
 * Project: SmallpoxAttackSim
 */
#include <random>
#include <fstream>


int main()
{
    const int n_persons = 5000;
    const int n_groups = 1000;
    const int minGroups = 3;
    const int maxGroups = 20;

    std::default_random_engine engine(std::random_device{}());
    std::uniform_int_distribution<int> groupRange(minGroups, maxGroups);
    std::uniform_int_distribution<int> groupDist(0, n_groups);

    std::vector<std::string> personVector;

    for (int p=0; p < n_persons; ++p)
    {
        int p_groups = groupRange(engine);
        std::string groups = "";

        for (int g=0; g < p_groups; ++g)
        {
            groups += std::to_string(groupDist(engine)) + " ";
        }
        personVector.push_back(groups);
    }

    std::ofstream fout;
    fout.open("./groups.data");
    for (int p=0; p< n_persons; ++p)
    {
        fout << personVector[p] << "\n";
    }
    fout.close();

    return 0;
}
