protocol SortingStrategy {
    func sort(_ array: [Int]) -> [Int]
}

class BubbleSortStrategy: SortingStrategy {
    func sort(_ array: [Int]) -> [Int] {
        var arr = array
        for i in 0..<arr.count {
            for j in 0..<(arr.count - i - 1) {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                }
            }
        }
        return arr
    }
}

class QuickSortStrategy: SortingStrategy {
    func sort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let pivot = array[array.count / 2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        return sort(less) + equal + sort(greater)
    }
}

class SortingContext {
    private var strategy: SortingStrategy

    init(strategy: SortingStrategy) {
        self.strategy = strategy
    }

    func setStrategy(_ strategy: SortingStrategy) {
        self.strategy = strategy
    }

    func sortArray(_ array: [Int]) -> [Int] {
        return strategy.sort(array)
    }
}

class SortingViewModel: ObservableObject {
    @Published var sortedArray: [Int] = []
    private var sortingContext: SortingContext

    init(strategy: SortingStrategy) {
        self.sortingContext = SortingContext(strategy: strategy)
    }

    func sortArray(_ array: [Int]) {
        sortedArray = sortingContext.sortArray(array)
    }

    func changeStrategy(to strategy: SortingStrategy) {
        sortingContext.setStrategy(strategy)
    }
}

struct SortingView: View {
    @StateObject private var viewModel: SortingViewModel
    init(viewModel: SortingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            List(viewModel.sortedArray, id: \.self) { number in
                Text("\(number)")
            }
            .navigationTitle("Sorted Array")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Bubble Sort") {
                        viewModel.changeStrategy(to: BubbleSortStrategy())
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Quick Sort") {
                        viewModel.changeStrategy(to: QuickSortStrategy())
                    }
                }
            }
        }
        .onAppear {
            viewModel.sortArray([5, 3, 8, 1, 2, 7])
        }
    }
}