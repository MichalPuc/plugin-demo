pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/MichalPuc/plugin-demo.git'
                bat '''
                python -m venv plugin-demo
                . plugin-demo/bin/activate
                pip install wheel
                pip install -r requirements.txt
                export TCMS_PRODUCT_VERSION=$JOB_NAME
                nosetests3 2> output.tap
                tcms-tap-plugin output.tap

                nosetests3 --with-xunit
                tcms-junit.xml-plugin nosetests.xml
                '''
            }
        }
    }
}
