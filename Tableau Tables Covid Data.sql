--1
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From ProjectPortfolio..CovidDeaths
where continent is not null
order by 1,2


--2
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From ProjectPortfolio..CovidDeaths
Where continent is null
and location not in ('world','European Union','International')
Group by location
Order by TotalDeathCount desc

--3
Select Location,Population,MAX(total_cases) as HighestInfectionCount, Max(total_cases/population)*100 as PercentagePopulationInfected
From ProjectPortfolio..CovidDeaths
Group by location,population
order by PercentagePopulationInfected desc

--4
Select location, population,date,MAX(total_cases) as HighestInfectionCount,Max(total_cases/population)*100 as PercentPopulationInfected
From ProjectPortfolio..CovidDeaths
Group by location,population,date
order by PercentPopulationInfected desc