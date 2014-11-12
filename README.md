Docker，最接近 "Build Once, Run Anywhere" 的輕量級虛擬技術
=========================

## Purpose

Supplemental materials for my [Docker speech at JCConf Taiwan 2014](http://jcconf.tw/docker-most-write-once-run-anywhere.html).


## 講題介紹

2013 年三月，[Docker 0.1.0](https://github.com/docker/docker/tree/v0.1.0) 首次對外亮相，短短 15 個月就推出 [1.0 版](https://github.com/docker/docker/tree/v1.0.0)，並獲得各主流 Linux 及 IaaS/PaaS 大廠的強力背書，就連微軟也無法忽視此一潮流，宣布與 Docker 合作。

只要照著 Docker 的 “infrastructure as code” 遊戲規則，程式只要在本機端寫好測好，後續的組態管理、持續整合、部署等各個 DevOps 環節，都透過同一套 Docker repository 機制，使用同一份系統映像檔，不再有惱人的 dependency hell 問題。

Docker 運用容器化技術，比傳統 hypervisor 虛擬化技術更輕量，更適合動態的 micro service 雲端環境。開放源碼血統，可避免被綁在特定實體電腦或雲端服務廠商身上，真正達到 “Build, Ship and Run Any App, Anywhere” 境界。

本講座介紹 Docker 的**核心觀念**，更以大量 live demo 帶你實際體驗 Docker 在 **dependency**、**isolation**、**lightweight**、**standard** 四方面的優異之處，讓你有信心踏上 Docker 的探索之旅。


參與此講座的朋友，如欲現場跟著 live demo，請根據以下各目錄 `README.md` 檔案的「**Preparation**」一節指示，先在網路暢通的地方備妥必要的軟體及設定。



## DEMO 相關目錄說明

**Dependency** 主題：

  - 會用到 [shared-kernel 目錄](shared-kernel/)。

**Isolation** 主題：

  - 同上。

**Lightweight** 主題：

  - Round #1: 同上。
  - Round #2: 會用到 [benchmark-by-redis 目錄](benchmark-by-redis/)。


**Standard** 主題：

  - 會用到 [linked-example 目錄](linked-example/)。
