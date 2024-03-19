select * from PROJECT.dbo.Data1;

select * from PROJECT.dbo.Data2;

-- PROBLEM1 number of rows into our datasets

select count(*) from PROJECT..Data1;

select count(*) from PROJECT..Data2;

-- ANSWER1-in Data1 table 640 rows and in Data2 table 640 rows



--PROBLEM2  extaract datset for JHARKHAND and BIHAR
  select * from PROJECT..Data1 where State in ('jharkhand','bihar');


  -- PROBLEM3  what is total poulation of INDIA

  select sum(population) from PROJECT..Data2;

  --Answer3   total population of india is 1210854977



  --PROBLEM4 what is the average growth of INDIA

  select AVG(growth)*100 avg_growth from PROJECT..Data1;
  --Answer4 INDIA has been growing at an avg growth of 19.24%



  --PROBLEM5 what is average growth% by state?

  select state,AVG(growth)*100 avg_growth from PROJECT..Data1 group by State;


  --PROBLEM6 What is the avg sex ratio by state?answer should be higher to lower order?

  select state,round(AVG(Sex_Ratio),0) avg_sex_ratio from PROJECT..Data1 group by State order by avg_sex_ratio desc;



  --PROBLEM7 list out the state name with average literacy rate greater than 90?


  select state,round(AVG(Literacy),0) avg_literacy from PROJECT..Data1 group by State having round(AVG(Literacy),0)>90 order by avg_literacy  desc;

  --Answer7 kerala-94% and lakshadweep-92%



  --PROBLEM8  NAME OF TOP 3 STATE HAVING HIGHEST AVERAGE GROWTH RATE?

   select top 3 state,AVG(growth)*100 avg_growth from PROJECT..Data1 group by State order by avg_growth desc;



   --PROBLEM9 name the bottom 3 state displaying loweest average sex ratio?

   select  top 3 state,round(AVG(Sex_Ratio),0) avg_sex_ratio from PROJECT..Data1 group by State order by avg_sex_ratio Asc;


   --PROBLEM10 name the states displaying top 3 and bottom 3 average literacy rate?
   drop table if exists #topstates
   create table #topstates

   (state nvarchar(255),topstates float) 
   
   insert into #topstates 

   select state,round(AVG(Literacy),0) avg_literacy from PROJECT..Data1 group by State  order by avg_literacy  desc

   select top 3 * from #topstates order by #topstates.topstates desc;


      drop table if exists #btmstates
   create table #btmstates

   (state nvarchar(255),btmstates float) 
   
   insert into #btmstates 

   select state,round(AVG(Literacy),0) avg_literacy from PROJECT..Data1 group by State  order by avg_literacy  desc

   select top 3 * from #btmstates order by #btmstates.btmstates asc;


   --union operator 
   select * from(
   select top 3 * from #topstates order by #topstates.topstates desc)a
   union
   select * from(
   select top 3 * from #btmstates order by #btmstates.btmstates asc)b





   --PROBLEM11 fetch all name of the  state starting with letter a or b?

   select distinct state from PROJECT..Data1 where lower(state) like 'a%' or lower(state)like 'b%'




  -- PROBLEM12 fetch all name of the  state starting with letter a but ending with letter m?



     select distinct state from PROJECT..Data1 where lower(state) like 'a%' and lower(state)like '%m'

    




   

