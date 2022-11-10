::===============================================================
:: Docker for Windows not Installed
:: Build and Push images in VM using Vagrant 
:: Pre-requisites:
::   Kubernetes config file configured
::   Vagrant and VirtualBox installed
::===============================================================
vagrant up
vagrant plugin install vagrant-scp
echo "Login in Docker Hub"
vagrant ssh -c "docker login -u palaro"
echo "Copying files..."
vagrant scp backend docker-vm:~/
vagrant scp database docker-vm:~/
echo "Building images..."
vagrant ssh -c "docker build -t palaro/projeto-backend:1.0 backend/."
vagrant ssh -c "docker build -t palaro/projeto-database:1.0 database/."
echo "Pushing images..."
vagrant ssh -c "docker push palaro/projeto-backend:1.0"
vagrant ssh -c "docker push palaro/projeto-database:1.0"
echo "Creating Services on kubernetes..."
kubectl apply -f services.yml
echo "Creating Deployments on kubernetes..."
kubectl apply -f pvc.yml
kubectl apply -f deploy.yml
