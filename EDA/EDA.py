import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Load the data
data = pd.read_csv('./seeds/sales_performance.csv')
data.describe(include='all')

# Set the aesthetics for the plots
sns.set(style="whitegrid")
# Adjusting the layout to add more vertical space between the charts
fig, axes = plt.subplots(4, 2, figsize=(14, 24), gridspec_kw={'width_ratios': [3, 1]})

# Leads
sns.histplot(data['leads'], bins=30, ax=axes[0, 0], kde=True)
axes[0, 0].set_title('Distribution of Leads')
sns.boxplot(x=data['leads'], ax=axes[0, 1])
axes[0, 1].set_title('Boxplot of Leads')

# Opportunities
sns.histplot(data['opportunities'], bins=30, ax=axes[1, 0], kde=True)
axes[1, 0].set_title('Distribution of Opportunities')
sns.boxplot(x=data['opportunities'], ax=axes[1, 1])
axes[1, 1].set_title('Boxplot of Opportunities')

# Closed Won
sns.histplot(data['closed_won'], bins=30, ax=axes[2, 0], kde=True)
axes[2, 0].set_title('Distribution of Closed Won')
sns.boxplot(x=data['closed_won'], ax=axes[2, 1])
axes[2, 1].set_title('Boxplot of Closed Won')

# Revenue
sns.histplot(data['revenue'], bins=30, ax=axes[3, 0], kde=True)
axes[3, 0].set_title('Distribution of Revenue')
sns.boxplot(x=data['revenue'], ax=axes[3, 1])
axes[3, 1].set_title('Boxplot of Revenue')

# Adding more vertical space between the plots for better clarity
fig.tight_layout(pad=1.0)
plt.savefig('eda.png')
plt.show()


