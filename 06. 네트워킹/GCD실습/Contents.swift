import UIKit

// Queue - Main, Global, Custom

    // - Main Queue
    DispatchQueue.main.async {
        // UI Update
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    // - Global Queue
    DispatchQueue.global(qos: .userInteractive).async {
        // 당장 해야 하는 것, 우선순위 제일
    }

    DispatchQueue.global(qos: .userInitiated).async {
        // 거의 바로 해야하는 것, 사용자가 결과를 기다린다
    }

    DispatchQueue.global(qos: .default).async {
        // 굳이 사용x -> global().async로 사용
    }

    DispatchQueue.global(qos: .utility).async {
        // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것, 네트워킹, 큰 파일 불러올 때
    }

    DispatchQueue.global(qos: .background).async {
        // 사용자한테 당장 인식될 필요가 없는 것, 뉴스데이터 미리 받기, 위치 업데이트, 영상 다운
    }

    // - Custom Queue
    let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
    let serialQueue = DispatchQueue(label: "serial", qos: .background)


// 복합적인 상황
func downloadImageFromServer() -> UIImage {
    // Heavy Task
    return UIImage()
}

func updateUI(image: UIImage) {

}

DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()

    DispatchQueue.main.async {
        // UI 관련 일들은 global에 놓으면 crash 가능성 있으므로 main에 놓음
        updateUI(image: image)
    }
}


// Sync, Async

// Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("b \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("u \(i)")
    }
}

// Sync
//DispatchQueue.global(qos: .background).sync {
//    for i in 0...5 {
//        print("b \(i)")
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).sync {
//    for i in 0...5 {
//        print("u \(i)")
//    }
//}
