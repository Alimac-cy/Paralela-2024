package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

const (
	cerillas = iota
	tabaco
	papel
)

var ingredientes = []string{"cerillas", "tabaco", "papel"}
var puedeConsumir = [3]chan bool{make(chan bool), make(chan bool), make(chan bool)}
var puedeProducir = make(chan bool)
var vecesTabaquero int
var vecesFumar int
var mu sync.Mutex
var wg sync.WaitGroup

func fumar() {
	miliseg := 100 + rand.Intn(1900)
	time.Sleep(time.Millisecond * time.Duration(miliseg))
}

func fumador(id int) {
	defer wg.Done()
	for {
		<-puedeConsumir[id]
		fmt.Printf("\tFumador %d recibió %s\n", id+1, ingredientes[id])
		puedeProducir <- true
		if rand.Intn(2) == 1 {
			mu.Lock()
			fumar()
			fmt.Printf("\t\tFumador %d fumó\n", id+1)
			vecesFumar++
			mu.Unlock()
		}
	}
}

func tabaquero() {
	for {
		<-puedeProducir
		producto := rand.Intn(3)
		fmt.Printf("Despachando %s...\n", ingredientes[producto])
		puedeConsumir[producto] <- true
		vecesTabaquero++
	}
}

func contador() {
	defer wg.Done()
	for {
		time.Sleep(2 * time.Second)
		mu.Lock()
		fmt.Printf("\n\tCONTADORES:\n\tIngredientes: %d\n\tCigarros: %d\n\n", vecesTabaquero, vecesFumar)
		mu.Unlock()
	}
}

func main() {
	rand.Seed(time.Now().UnixNano())
	vecesTabaquero = 0
	vecesFumar = 0
	for i := 0; i < 3; i++ {
		puedeConsumir[i] = make(chan bool, 1)
	}
	puedeProducir = make(chan bool, 1)
	puedeProducir <- true
	wg.Add(4)
	for i := 0; i < 3; i++ {
		go fumador(i)
	}
	go tabaquero()
	go contador()
	wg.Wait()
}
