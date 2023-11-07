---
theme: ./theme
fonts:
  sans: 'MonoLisa'
  serif: 'MonoLisa'
  mono: 'MonoLisa'
  local: 'MonoLisa'
colorSchema: dark
highlighter: shiki
lineNumbers: true
layout: intro
title: npx decarbonize-node
---

# npx decarbonize-node

Workshop on sustainability in software development with<br/>glimpses for nodejs.

<div class="absolute bottom-10">
  <span class="rounded cursor-pointer hover:bg-white hover:bg-opacity-10">
    climate-neutral building portfolio.<br/>
    Simple. Profitable. Now.
  </span>
</div>
<div class="absolute bottom-10 right-10">
  <img src="/ae_logo_white.png" class="w-30"/>
</div>

<style>
h1 {
  font-size: 3rem !important;
}
</style>
---
layout: intro-image
---

# Me, Marco
BackendEngineer at AMPEERS Energy
- 🌱 coding enthusiast, loves the mountains
- Lechvalley based
- Loves (& hates) the modern coding world
- Wants to learn Kafka
- ... along with some good coffee ☕️
- Say hi at @marcomuellner  

<style>
  .w-special {
    width: 250px;
    height: auto;
  }
</style>

<div class="absolute top-33 right-10">
  <img src="/marco.jpeg" class="w-special"/>
</div>

---
layout: intro-image
---

# Me, Lucas
CTO at AMPEERS Energy
- 🌱 Green CTO, Tech-Lover
- Dresden based
- Loves (& hates) NodeJS, Python & Scala
- Wants to learn Rust
- ... along with some good coffee ☕️
- Say hi at @lrecknagel

<style>
  .w-special {
    width: 250px;
    height: auto;
  }
</style>

<div class="absolute top-33 right-10">
  <img src="/lucas.png" class="w-special"/>
</div>

---
layout: default
---

# AMPEERS Energy

Decarbonize the real-estate market with a _simple, profitable_ flow, _now!_.

- Founded May, 2019
- Based in Munich
- Spread over Germany (Berlin, Dresden, ...)
- From 5 to 100+ Peers

<div class="absolute top-33 right-10">
  <img src="/team.png" class="w-100"/>
</div>
<div class="absolute bottom-10 right-10">
  <img src="/ae_logo_white.png" class="w-30"/>
</div>

---
layout: fact
---

# Sustainability - Clouds & Node.js?!

<br/>
<p>we have to push it more!</p>

<!--
* needs more attention
* seems small - but we need to take every action
-->

---
layout: statement
---

# Disclaimer´s

<br/>
<br/>

## no blaming -> awareness!
## no deep tech -> we want to sensitize!

<!--
* we talks about websites, packes, clouds
* we are not blaming anyone or any package
* its all cool stuff out there - but we want to sensitize
* today we have a mix of sensitize and workshop :)
-->

<style>
  h2 {
    text-align: left !important;
  }
</style>

---
layout: image-right
image: cloud_costs.png
---

# Today´s workshop

- ☁️ **Cloud Carbon Emissions**<br/>Insights
- 📦 **npm packages**<br/>footprints, how to check them
- 🍀 **nodejs tracking**<br/>via co2.js
- 🗺️ **CodeQL**<br/>find pitfalls via code queries

<!--
* insights of websites, clouds & possible metrics
* what npm means in terms of carbon emissions
* how you can apply tracking to your apps
* codeQL intro - with sustainability ideas
* from rough (complete cloud emission to fine grained per node app)
-->

---
layout: image
image: carbon_emissions_computation.png
---

<!--
* Cloud computing contributes between 2.5%-3.7% of global carbon emissions,
* Aviation industry contributes 2.5%.
* By 2030, data centers are projected to consume 13% of global electricity​.

* electricity consumption (to run the servers)
* water consumption (to cool the servers) 
* and the lifetime of the equipment (which impacts the frequency of replacements).
-->

---
layout: default
---

# ☁️ Impact of Cloud Provider

| Cloud Service Provider | Environmental Commitments | Additional Information |
|------------------------|---------------------------|------------------------|
| AWS                    | Net-zero by 2040 <br>100% renewable by 2030 | - |
| Azure                  | Carbon-negative by 2030 | - |
| GCP                    | Carbon-neutral since 2007 <br> 100% renewable since 2017 <br>24/7 carbon-free energy by 2030 | Most environmentally friendly (Greenpeace report) <br>Best based on Green Algorithms method |

---
layout: fact
---

## npx decarbonize-node

---
layout: fact
---

## if not ...
### git clone git@github.com:ampeersenergy/decarbonize-node-workshop
### git clone git@github.com:ampeersenergy/squirrels-sift

---
layout: fact
---

# Cloud Carbon Emissions

---
layout: default
---

# npm packages

* downloading npm packages consumes energy
* lets see a example with some assumptions:
  * ongoing topic: __temporal__
  * taking summation on top 5 date libs:
    * moment: 15.369.532
    * dayjs: 14.088.800
    * date-fns: 12.819.389 
    * luxon: 4.690.763
    * spacetime: 39.117 

---
layout: fact
---

## ~ 15.275 kg / 25 flights
### ~ 32259 kWh

---
layout: fact
---

## QuickWins?

node --watch, --experimental-loader, --tests

---
layout: intro
---

# Thanks for having us!

for: npx decarbonize-node

<div class="absolute bottom-10">
  <span class="font-700">
    Marco Müllner, <a href="https://github.com/marcomuellner">github@marcomuellner</a> | 07.11.2023
  </span><br/>
  <span class="font-700">
    Lucas Recknagel, <a href="https://twitter.com/lucasrecknagel">@lrecknagel</a> | 07.11.2023
  </span>
</div>
<div class="absolute bottom-10 right-10">
  <a href="https://ampeersenergy.com">More on AMPEERS</a>
  <!--
...
-->
</div>


---
layout: default
---

# Sources / Futher info

* [CloudCarbonFootprintReport](https://www.xomnia.com/post/ai-carbon-footprint/)
* [ClimatiqGreenhouseGasEmissions](https://www.climatiq.io/blog/measure-greenhouse-gas-emissions-carbon-data-centres-cloud-computing)
* [ClimatiqCloudCalculator](https://www.climatiq.io/docs/guides/tutorials/cloud)
