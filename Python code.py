#!/usr/bin/env python
# coding: utf-8

# In[3]:


def merge_sort(list1):
    if len(list1)==1:
        return list1
    mid=len(list1)//2
    list1_l=list1[:mid]
    list1_r=list1[mid:]
    list1_l=merge_sort(list1_l)
    list1_r=merge_sort(list1_r)
    return merge(list1_l,list1_r)


# In[6]:


def merge(list1,list2):
    m_result=[]
    while len(list1)!=0 and len(list2)!=0:
        if list1[0]<list2[0]:
            m_result.append(list1[0])
            list1.remove(list1[0])
        else:
            m_result.append(list2[0])                
            list2.remove(list2[0])
    if len(list1)==0:
        m_result=m_result+list2
    else:
        m_result=m_result+list1
    return m_result


# In[7]:


lst=[]
while True:
    temp=input("Please enter a number(Enter . to stop)")
    if temp==".":
        break
    lst.append(int(temp))
print("The unsorted list is:\n",lst)
print("The sorted list is:\n",merge_sort(lst))


# In[ ]:




