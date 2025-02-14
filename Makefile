release: backend frontend
debug: backend-dbg frontend-dbg

bdir:
	mkdir -p build/

clean:
	rm -rf build/
backend: bdir
	$(CXX) --std=c++20 main.cpp -o build/Snek3D -static -flto -Wno-narrowing -lstdc++

fdeps: bdir
	cp frontend/vertex.vert build/
	cp frontend/frag.frag   build/
	cp frontend/ico.png     build/

backend-dbg: bdir
	$(CXX) --std=c++20 -g -Og main.cpp -o build/Snek3D -Wno-narrowing

frontend: bdir fdeps
	cd frontend && make
	mv frontend/Snek3D-Frontend build/

frontend-dbg: bdir fdeps
	cd frontend && make debug
	mv frontend/Snek3D-Frontend build/
